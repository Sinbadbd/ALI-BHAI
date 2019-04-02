//
//  ProductDetailsController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class ProductDetailsController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    
    var collectionView : UICollectionView!
    private var scrollView : UIScrollView!
    var contentView: UIView!
    
    var product : Products?
    var productImages = [ImagesAll]()
    var products = [Products]()
    
    
    let titleLable:UILabel = UILabel()
    let strikPrice:UILabel = UILabel()
    let orginalPrice:UILabel = UILabel()
    let titleDescription:UILabel = UILabel()
    
    
    
    var productId : Int! {
        didSet {
            print("app id", productId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //imgSlider = product?.images
        //self.productImages = product?.images
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        self.collectionView.register(ImageSliderCell.self, forCellWithReuseIdentifier: IMAGE_SLIDER_ID)
        
        self.setupViews()
        addChildViews()
        fetchDetailsApi()
        
        view.backgroundColor = .white
     let theHeight = view.frame.size.height
        let bottomView = UIView()
        view.addSubview(bottomView)
        bottomView.frame = CGRect(x: 0, y: theHeight - 100 , width: view.frame.width, height: 100)
        bottomView.backgroundColor = .red
        
    }
    override func viewWillAppear(_ animated: Bool) { 
        self.tabBarController?.tabBar.isHidden = true
    }
   
    func fetchDetailsApi(){
        ApiClient.getProdutsId(id: productId ) { (response, error) in
            self.product = response
//            print(response?.id, response?.name)
            DispatchQueue.main.async {
                self.view.setNeedsDisplay()
                self.titleLable.text = response?.name
                self.titleDescription.text = response?.short_description
                if let response = response {
                    self.productImages = response.images
                }
                
                self.collectionView.reloadData()
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("count images  === \(productImages.count)")
        
        return productImages.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IMAGE_SLIDER_ID, for: indexPath) as! ImageSliderCell
        
        let url = URL(string: product?.images[0].src ?? "" )
        cell.imageV.kf.setImage(with: url)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 200)
    }
    
    
    /** define the scrollview and content view along with the layout constraints */
    func setupViews() {
        self.view.backgroundColor = .white
        
        self.scrollView = UIScrollView()
        self.contentView = UIView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.backgroundColor = .white
        //        self.contentView.backgroundColor = .blue
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
            //Obsereve here for the top constraint, As given safeAreaLayoutGuide for not to conflict with the status bar
            //As this is especially useful for the X-series devices as they have top notch area
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            ])
        
        self.scrollView.addSubview(contentView)
        self.scrollView.addConstraints([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            ])
        
        //To stop the scroll view horizontal scrolling, we are giving the same width for the content view as well
        self.view.addConstraints([
            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
            ])
    }
    
    let bottomCartView = UIView()
    func addChildViews() {
        //Init
        let topHeaderView = UIView()
        let imageCollectionView = UIView()
        self.contentView.addSubview(topHeaderView)
        self.contentView.addSubview(imageCollectionView)
        
        self.contentView.addSubview(titleLable)
        titleLable.text = "HAHAHAHAHAHA"
        
        self.contentView.addSubview(titleDescription)
        titleDescription.text = "titleDescription"
        titleDescription.textColor = UIColor.gray
        titleDescription.numberOfLines = 3
        
        self.contentView.addSubview(collectionView)
    
        
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        bottomCartView.translatesAutoresizingMaskIntoConstraints = false
        bottomCartView.backgroundColor = .red
        self.contentView.addConstraints([
            
            titleLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLable.heightAnchor.constraint(equalToConstant: 20),
            
            titleDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleDescription.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            titleDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleDescription.heightAnchor.constraint(equalToConstant: 50),
            
            collectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            collectionView.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 20),
            collectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            ])
        
     
        
    }
    
}


//fileprivate func setupName(){
//    let height = CGFloat(50)
//
//    lblName.text = "Hello world"
//    lblName.backgroundColor = .lightGray
//
//    //Step 1
//    lblName.translatesAutoresizingMaskIntoConstraints = false
//
//    //Step 2
//    self.view.addSubview(lblName)
//
//    //Step 3
//    NSLayoutConstraint.activate([
//
//        lblName.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
//        lblName.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
//        lblName.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor,constant: -height),
//        lblName.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//
//}

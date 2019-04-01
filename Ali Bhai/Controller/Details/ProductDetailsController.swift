//
//  ProductDetailsController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class ProductDetailsController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IMAGE_SLIDER_ID, for: indexPath) as! ImageSliderCell
        
        return cell
    }
    

 
    var collectionView : UICollectionView!
    
    private var scrollView : UIScrollView!
    var contentView: UIView!
    
    var product : Products?
    var productId : Int! {
        didSet {
            print("app id", productId)
        }
    }
    
    let imageV:UIImageView = UIImageView()
    let strikPrice:UILabel = UILabel()
    let orginalPrice:UILabel = UILabel()
    let titleDescription:UILabel = UILabel()
    let titleLable:UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.setupViews()
        addChildViews()
 
        self.collectionView.register(ImageSliderCell.self, forCellWithReuseIdentifier: IMAGE_SLIDER_ID)
        
        view.backgroundColor = .white
        ApiClient.getProdutsId(id: productId ) { (response, error) in
            // print("haha")
            self.product = response
            print(response?.id, response?.name)
            DispatchQueue.main.async {
                self.view.setNeedsDisplay()
                self.titleLable.text = response?.name
                self.titleDescription.text = response?.short_description
            }
        }
        //self.viewWillAppear(true)
      
     
        
        
    }
    
    /** define the scrollview and content view along with the layout constraints */
    func setupViews() {
        self.view.backgroundColor = .white
        
        self.scrollView = UIScrollView()
        self.contentView = UIView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.scrollView.backgroundColor = .white
        self.contentView.backgroundColor = .blue
        
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
    
    func addChildViews() {
        //Init
        let topHeaderView = UIView()
        let imageCollectionView = UIView()
        //Theme
        topHeaderView.backgroundColor = UIColor.green
        imageCollectionView.backgroundColor = UIColor.red
        
        
        //Layout -- Child views are added to the 'ContentView'
        self.contentView.addSubview(topHeaderView)
        self.contentView.addSubview(imageCollectionView)
        
        self.contentView.addSubview(titleLable)
        titleLable.text = "HAHAHAHAHAHA"
        titleLable.backgroundColor = .white
        
        self.contentView.addSubview(titleDescription)
        titleDescription.text = "titleDescription"
        titleDescription.textColor = UIColor.gray
        titleDescription.numberOfLines = 3
        
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addConstraints([
 
            titleLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLable.heightAnchor.constraint(equalToConstant: 30),
            
            titleDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleDescription.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            titleDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleDescription.heightAnchor.constraint(equalToConstant: 60),
            
            imageCollectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageCollectionView.topAnchor.constraint(equalTo: titleDescription.bottomAnchor, constant: 50),
            imageCollectionView.widthAnchor.constraint(equalToConstant: view.frame.width),
            imageCollectionView.heightAnchor.constraint(equalToConstant: 200),
            imageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
            ])
        
    }
    
}



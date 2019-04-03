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
    let fullDescription:UILabel = UILabel()
    let stock_status:UILabel = UILabel()
    
    
    var productId : Int! {
        didSet {
            print("app id", productId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        setupName()
        view.backgroundColor = .white
        let theHeight = view.frame.size.height
        let bottomView = UIView()
        // view.addSubview(bottomView)
        bottomView.frame = CGRect(x: 0, y: theHeight - 100 , width: view.frame.width, height: 100)
        bottomView.backgroundColor = .red
        
    }
    override func viewWillAppear(_ animated: Bool) { 
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func fetchDetailsApi(){
        ApiClient.getProdutsId(id: productId ) { (response, error) in
            SVProgressHUD.show()
            self.product = response
            DispatchQueue.main.async {
                self.view.setNeedsDisplay()
                self.titleLable.text = response?.name
                self.titleDescription.text = response?.short_description
                self.strikPrice.text = response?.sale_price
                self.orginalPrice.text = response?.price
                self.stock_status.text = response?.stock_status
                self.fullDescription.text = response?.description
                if let response = response {
                    self.productImages = response.images
                }
                
                self.collectionView.reloadData()
                SVProgressHUD.dismiss()
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
    
    let bottomView = UILabel()
    let addToCartButton = UIButton()
    let buyNowButton = UIButton()
    fileprivate func setupName(){
        let height = CGFloat(60)
        
        //        bottomView.backgroundColor = .lightGray
        
        //Step 1
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomView)
        
        bottomView.addSubview(addToCartButton)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.setTitle("ADD TO CART", for: .normal)
        addToCartButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        addToCartButton.layer.borderColor = #colorLiteral(red: 0.968627451, green: 0.4745098039, blue: 0.4784313725, alpha: 1)
        addToCartButton.layer.borderWidth = 1
        addToCartButton.layer.cornerRadius = 6
        addToCartButton.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
        
        buyNowButton.translatesAutoresizingMaskIntoConstraints = false
        bottomView.addSubview(buyNowButton)
        buyNowButton.translatesAutoresizingMaskIntoConstraints = false
        buyNowButton.setTitle("Buy Now", for: .normal)
        buyNowButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        buyNowButton.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.4745098039, blue: 0.4784313725, alpha: 1)
        buyNowButton.layer.cornerRadius = 6
        buyNowButton.addTarget(self, action: #selector(handleBuyButton), for: .touchUpInside)
        //Step 3
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            bottomView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -height),
            bottomView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            addToCartButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            addToCartButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 20),
            addToCartButton.widthAnchor.constraint(equalToConstant: 170),
            addToCartButton.heightAnchor.constraint(equalToConstant: 45),
            
            buyNowButton.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor),
            buyNowButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -20),
            buyNowButton.widthAnchor.constraint(equalToConstant: 170),
            buyNowButton.heightAnchor.constraint(equalToConstant: 45),
            
            
            ])
        
    }
    
    @objc func handleAddToCart(){
        print("add to cart")
    }
    
    @objc func handleBuyButton(){
          print("buy---")
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
        
        self.contentView.addSubview(orginalPrice)
        orginalPrice.text = "13212313"
        orginalPrice.textColor = .red
        //        orginalPrice.backgroundColor = .green
        orginalPrice.numberOfLines = 1
        orginalPrice.font = UIFont.boldSystemFont(ofSize: 30)
        
        self.contentView.addSubview(strikPrice)
        strikPrice.text = "13212313"
        strikPrice.textColor = .gray
        //        strikPrice.backgroundColor = .blue
        strikPrice.numberOfLines = 1
        strikPrice.font = UIFont.boldSystemFont(ofSize: 24)
        
        self.contentView.addSubview(stock_status)
        stock_status.text = "In Stock"
        stock_status.textColor = .gray
        //        stock_status.backgroundColor = .blue
        stock_status.numberOfLines = 1
        stock_status.font = UIFont.boldSystemFont(ofSize: 18)
        
        self.contentView.addSubview(fullDescription)
        fullDescription.text = "full Description"
        fullDescription.textColor = .gray
        //        fullDescription.backgroundColor = .blue
        fullDescription.numberOfLines = 5
        fullDescription.font = UIFont.boldSystemFont(ofSize: 18)
        
        
        
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
        bottomCartView.translatesAutoresizingMaskIntoConstraints = false
        orginalPrice.translatesAutoresizingMaskIntoConstraints = false
        strikPrice.translatesAutoresizingMaskIntoConstraints = false
        stock_status.translatesAutoresizingMaskIntoConstraints = false
        fullDescription.translatesAutoresizingMaskIntoConstraints = false
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
            //            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            orginalPrice.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orginalPrice.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            orginalPrice.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            //            orginalPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -106),
            orginalPrice.widthAnchor.constraint(equalToConstant: 150),
            orginalPrice.heightAnchor.constraint(equalToConstant: 30),
            orginalPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            strikPrice.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            strikPrice.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            strikPrice.leadingAnchor.constraint(equalTo: orginalPrice.trailingAnchor, constant: 100),
            //         strikPrice.trailingAnchor.constraint(equalTo: orginalPrice.trailingAnchor, constant: -16),
            strikPrice.widthAnchor.constraint(equalToConstant: 100),
            strikPrice.heightAnchor.constraint(equalToConstant: 30),
            strikPrice.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            stock_status.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stock_status.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            //            inStock.leadingAnchor.constraint(equalTo: orginalPrice.trailingAnchor, constant: 100),
            stock_status.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stock_status.widthAnchor.constraint(equalToConstant: 100),
            stock_status.heightAnchor.constraint(equalToConstant: 30),
            stock_status.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            //            fullDescription.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            fullDescription.topAnchor.constraint(equalTo: orginalPrice.bottomAnchor, constant: 20),
            fullDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            fullDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            fullDescription.widthAnchor.constraint(equalToConstant: view.frame.width - 16),
            fullDescription.heightAnchor.constraint(equalToConstant: 100),
            //            fullDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            
            ])
        
    }
    
}



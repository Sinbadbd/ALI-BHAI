//
//  ProductDetailsVC.swift
//  Ali Bhai
//
//  Created by sinbad on 5/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher

 extension ProductDetailsVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewSlider.dequeueReusableCell(withReuseIdentifier: IMAGE_CELL, for: indexPath) as! ImageSliderCell
        let url = URL(string: product?.images[0].src ?? "" )
        
        // cell.imageV.kf.indicatorType = .activity
        cell.imageV.kf.setImage(with: url)
        return cell
    }
 }



class ProductDetailsVC: UIViewController {
    
    var product : Products?
    var productImages = [ImagesAll]()
    var products = [Products]()
    
    
    let titleLable:UILabel = UILabel()
    let strikPrice:UILabel = UILabel()
    let orginalPrice:UILabel = UILabel()
    let titleDescription:UILabel = UILabel()
    let fullDescription:UILabel = UILabel()
    let stock_status:UILabel = UILabel()
    
    let productTitleLabel :UILabel = UILabel()
    let productShortDescrition: UILabel = UILabel()
    let productPrice:UILabel = UILabel()
    
    let addToCartButton : UIButton = UIButton(type: .system)
    
    let  IMAGE_CELL = "IMAGE_CELL"
    
    var productId : Int! {
        didSet {
            print("app id", productId)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViews()
        
        collectionViewSlider.delegate = self
        collectionViewSlider.dataSource = self
        collectionViewSlider.register(ImageSliderCell.self, forCellWithReuseIdentifier: IMAGE_CELL)
        fetchDetailsApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.tabBarController?.tabBar.isHidden = true
    }
 
    var attributes = [AttributesProducts]()
    func fetchDetailsApi(){
        ApiClient.getProdutsId(id: productId ) { (response, error) in
          //  SVProgressHUD.show()
            self.product = response
            DispatchQueue.main.async {
                self.view.setNeedsDisplay()
 
                if let response = response {
                    self.productTitleLabel.text = response.name
                    self.productPrice.text = "BDT \(response.price)"
                    self.productShortDescrition.text = (response.short_description).stripOutHtml()
 
                    let attribute  = response.attributes[0]
                     print("attribute---\(attribute.options)")
                    
                    self.productImages = response.images
                    
                    var xOffest:CGFloat = 20
                    
//                    for attr in attribute.options {
//
//                    }
                    
                   
//                    for color in 0..< attributes[0].options {
//                        let colorButton = UIButton(frame: CGRect(x: xOffest, y: 550, width: 50, height: 50))
//                        xOffest += 60
//                        colorButton.backgroundColor = self.hexStringToUIColor( hex: self.colorValus[color])
//                        colorButton.layer.cornerRadius = colorButton.frame.width / 2
//                        colorButton.layer.borderWidth = 1
//                        colorButton.titleLabel?.text = "\(color)"
//                       // colorButton.addTarget(self, action: #selector(handleColorBtn), for: .touchUpInside)
//                        self.view.addSubview(colorButton)
//                       // print("\(index) \(color)")
//                    }
                }
                
              self.collectionViewSlider.reloadData()
              //  SVProgressHUD.dismiss()
            }
        }
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8)  / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    @objc func handleFav(){
        print("--")
    }
    let scrollView = UIScrollView()
    let contentView = UIView()
    func setupScrollView(){
        
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.backgroundColor = .white
        
        self.view.addSubview(scrollView)
        self.view.addConstraints([
            //Obsereve here for the top constraint, As given safeAreaLayoutGuide for not to conflict with the status bar
            //As this is especially useful for the X-series devices as they have top notch area
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            ])
        self.scrollView.contentInsetAdjustmentBehavior = .never
        
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
    
    func setupViews(){
        
        
        contentView.addSubview(collectionViewSlider)
        collectionViewSlider.translatesAutoresizingMaskIntoConstraints = false
        collectionViewSlider.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: CGSize(width: collectionViewSlider.frame.width, height: 400))
       // collectionViewSlider.backgroundColor = .red
       
        //addToCartButton
        view.addSubview(addToCartButton)
        addToCartButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20), size: CGSize(width: 300, height: 50))
        addToCartButton.backgroundColor = #colorLiteral(red: 0.9693114161, green: 0.4762580991, blue: 0.4769517779, alpha: 1)
        addToCartButton.setTitle("ADD TO CART", for: .normal)
        addToCartButton.setTitleColor(UIColor.white, for: .normal)
        addToCartButton.clipsToBounds = true
        addToCartButton.layer.cornerRadius = 10
        addToCartButton.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
        
        //productTitleLabel
        contentView.addSubview(productTitleLabel)
        productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        productTitleLabel.anchor(top: collectionViewSlider.bottomAnchor, leading: collectionViewSlider.leadingAnchor, bottom: nil, trailing: collectionViewSlider.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: 20), size: CGSize(width: productTitleLabel.frame.width, height: productTitleLabel.frame.height))
        productTitleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        productTitleLabel.sizeToFit()
        
        //productPrice
        contentView.addSubview(productPrice)
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        productPrice.anchor(top: productTitleLabel.bottomAnchor, leading: collectionViewSlider.leadingAnchor, bottom: nil, trailing: collectionViewSlider.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: 15), size: CGSize(width: productTitleLabel.frame.width, height: productTitleLabel.frame.height))
        productPrice.font = UIFont.boldSystemFont(ofSize: 30)
        productPrice.textColor = #colorLiteral(red: 0.9693114161, green: 0.4762580991, blue: 0.4769517779, alpha: 1)
        productPrice.sizeToFit()
        
        //productShortDescrition
        contentView.addSubview(productShortDescrition)
        productShortDescrition.translatesAutoresizingMaskIntoConstraints = false
        productShortDescrition.anchor(top: productPrice.bottomAnchor, leading: collectionViewSlider.leadingAnchor, bottom: nil, trailing: productPrice.trailingAnchor, padding: .init(top: 10, left: 20, bottom: 0, right: 20),size: CGSize(width: productShortDescrition.frame.width, height: productShortDescrition.frame.height))
        productShortDescrition.font = UIFont.systemFont(ofSize: 18)
        productShortDescrition.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        productShortDescrition.numberOfLines = 0
        productShortDescrition.sizeToFit() 
        
        
    }
    
    let collectionViewSlider : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    @objc func handleAddToCart(){
    
        print("before----add cart")
        ApiClient.addToCart(productID: productId) { (success, error) in
            if success {
                self.showToast(message: "Product successfully added to cart. Click here to view cart.")
                print("after----add cart")
                print(self.productId)
            }
         
        }
    }
}

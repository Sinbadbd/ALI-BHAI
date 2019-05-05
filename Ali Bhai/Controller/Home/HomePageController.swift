//
//  HomePageController.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import SVProgressHUD
import Kingfisher

class HomePageController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let CATEGORY_CELL =  "CATEGORY_CELL"
    let PRODUCT_CELL = "PRODUCT_CELL"
    let HOME_IMAGE_CELL = "HOME_IMAGE_CELL"
    
    var product = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        fetchData()
        apiData()
        
       isSplashScreen()
        
    }
    override func viewWillAppear(_ animated: Bool) {
       self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func isSplashScreen()-> Bool {
        return UserDefaults.standard.bool(forKey: "splash")
    }
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    func fetchData() {
        ApiClient.getAllProducts { (response, error) in
            if let response = response {
                self.product = response
                DispatchQueue.main.async { 
                    self.collectionView.reloadData()
                }
            }
            
        }
    }
    
    func setupViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CATEGORY_CELL)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: PRODUCT_CELL)
        collectionView.register(HomeImageSliderCell.self, forCellWithReuseIdentifier: HOME_IMAGE_CELL)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init())
        
    }
    var category = [Category]()
    
    func apiData (){
        ApiClient.getAllCategory { (response, error) in
            if let response = response {
                self.category = response
                print("cat\(response)")
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return product.count
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = product[indexPath.item]
        let detailsControler = ProductDetailsController()
        detailsControler.productId = selected.id
        self.navigationController?.pushViewController(detailsControler, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOME_IMAGE_CELL, for: indexPath) as! HomeImageSliderCell
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CATEGORY_CELL, for: indexPath) as! CategoryCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PRODUCT_CELL, for: indexPath) as! ProductCell
            let productData = product[indexPath.item]
            cell.productTitle.text = productData.name
            cell.productPrice.text = productData.price
            cell.productOldPrice.text = productData.sale_price
            let url = URL(string: productData.images[0].src)
            cell.productImage.kf.setImage(with: url)
            
            cell.layer.cornerRadius = 10
            cell.layer.shadowColor = UIColor.gray.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
            cell.layer.shadowRadius = 1.0
            cell.layer.shadowOpacity = 0.5
            cell.layer.masksToBounds = false
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 300)
        } else if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 140)
        } else {
            return CGSize(width: (view.frame.width) / 2 - 16 , height: 250)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 8, bottom: 10, right: 8)
        } else if section == 1 {
            
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        } else {
            
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
    }
}



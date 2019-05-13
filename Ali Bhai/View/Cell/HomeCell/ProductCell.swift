//
//  ProductCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ProductLocal : Object {
    @objc dynamic var id = ""
    @objc dynamic var productName = ""
    @objc dynamic var price = ""
}


class ProductCell: UICollectionViewCell {
    
    var realm = try! Realm()
    
    let productImage:UIImageView = UIImageView()
    let productTitle:UILabel = UILabel(title: "This is text", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 16)
    let productPrice:UILabel = UILabel(title: "BDT 15200", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 14)
    let productOldPrice:UILabel = UILabel(title: "BDT 54", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 13)
    let productFavoriteBtn:UIButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    func setupUI(){
        addSubview(productImage)
        addSubview(productTitle)
        addSubview(productPrice)
        addSubview(productOldPrice)
        addSubview(productFavoriteBtn)
        backgroundColor = .white
        productImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 5), size: CGSize(width: 191, height: 150))
       // productImage.backgroundColor = .blue
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        
        productTitle.anchor(top: productImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0))
        productPrice.anchor(top: productTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 5, right: 0), size: CGSize(width: productPrice.frame.width, height: 20))
        productOldPrice.anchor(top: productPrice.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0), size: CGSize(width: productPrice.frame.width, height: 20))
//        productFavoriteBtn.anchor(top: nil, leading: productOldPrice.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 5), size: CGSize(width: 20, height: 20))
//        productFavoriteBtn.backgroundColor = .red
//        productFavoriteBtn.contentMode = .scaleAspectFill
//        productFavoriteBtn.clipsToBounds = true
//        productFavoriteBtn.addTarget(self, action: #selector(handleFavItem), for: .touchUpInside)
    }
    
    var products : Products?
    var productLocal = ProductLocal()
    
    @objc func handleFavItem(){
        
        
        
        productLocal.id = "1"
        productLocal.productName = "This is first product"
        productLocal.price = "231231231"
        
        try! realm.write {
            realm.add(productLocal)
        }
        
        
        let allProducts = realm.objects(ProductLocal.self)
        print("Count=====\(allProducts.count)")
        let data = allProducts.first
        print(data?.id, data?.productName, data?.price)
        
        
        print("hi")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

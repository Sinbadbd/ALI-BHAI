//
//  ProductCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class ProductCell: UICollectionViewCell {
    
    let productImage:UIImageView = UIImageView()
    let productTitle:UILabel = UILabel(title: "This is text", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 16)
    let productPrice:UILabel = UILabel(title: "BDT 15200", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 14)
    let productOldPrice:UILabel = UILabel(title: "BDT 54", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 13)
    let productFavoriteItem:UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    func setupUI(){
        addSubview(productImage)
        addSubview(productTitle)
        addSubview(productPrice)
        addSubview(productOldPrice)
        addSubview(productFavoriteItem)
        backgroundColor = .white
        productImage.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 5, right: 5), size: CGSize(width: 191, height: 150))
       // productImage.backgroundColor = .blue
        productImage.contentMode = .scaleAspectFill
        productImage.clipsToBounds = true
        
        productTitle.anchor(top: productImage.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0))
        productPrice.anchor(top: productTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 10, bottom: 5, right: 0))
        productOldPrice.anchor(top: productPrice.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 5, left: 10, bottom: 5, right: 0))
        productFavoriteItem.anchor(top: nil, leading: productOldPrice.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 5, right: 5), size: CGSize(width: 20, height: 20))
       // productFavoriteItem.backgroundColor = .yellow
        productFavoriteItem.contentMode = .scaleAspectFill
        productFavoriteItem.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  CartTableViewCell.swift
//  Ali Bhai
//
//  Created by sinbad on 5/13/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    let cartImage:UIImageView = UIImageView()
    let cartProductTitle:UILabel = UILabel()
    let cartProductPrice:UILabel = UILabel()
    let cartDeleteButton:UIButton = UIButton(type: .system)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCartUI()
    }
    
    func setupCartUI(){
        addSubview(cartImage)
        cartImage.translatesAutoresizingMaskIntoConstraints = false
       // cartImage.image = #imageLiteral(resourceName: "grocery")
        cartImage.contentMode = .scaleAspectFit
        cartImage.backgroundColor = .red
        cartImage.anchor(top:topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 10, left: 5, bottom: 5, right: 5), size: CGSize(width: 150, height: 100))
        //cartImage.centerXInSuperview()
        
        addSubview(cartProductTitle)
        cartProductTitle.translatesAutoresizingMaskIntoConstraints = false
        cartProductTitle.font = UIFont.boldSystemFont(ofSize: 24)
        cartProductTitle.anchor(top: topAnchor, leading: cartImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 0), size: CGSize(width: 200, height: cartProductTitle.frame.height))
        cartProductTitle.numberOfLines = 0
        cartProductTitle.text = "Override this method when the rows of your table are not all the same height. If your rows are the same heightOverride this method when the rows of your table are not all the same height. If your rows are the same heightOverride this method when the rows of your table are not all the same height. If your rows are the same height"
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

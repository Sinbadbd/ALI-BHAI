//
//  HomePageCell.swift
//  Ali Bhai
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class HomePageCell : UICollectionViewCell {
    
    let appImage = UIImageView(cornerRadius: 10)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appImage)
        
        appImage.backgroundColor = .green
        appImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        appImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        appImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        appImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        appImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        appImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  ImageSliderCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/1/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class ImageSliderCell : UICollectionViewCell {
    
    var imageV:UIImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       // imageV.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
        addSubview(imageV)
        imageV.image = #imageLiteral(resourceName: "grocery")
        imageV.layer.cornerRadius = 12
        imageV.clipsToBounds = true
        imageV.contentMode = .scaleAspectFill
        imageV.layer.borderColor = UIColor.lightGray.cgColor
        imageV.layer.borderWidth = 1
        imageV.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

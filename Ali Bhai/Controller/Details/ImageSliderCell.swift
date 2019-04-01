//
//  ImageSliderCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/1/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class ImageSliderCell : UICollectionViewCell {
    
    var productImages = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .yellow
        
        addSubview(productImages)
        productImages.widthAnchor.constraint(equalToConstant: 150)
        productImages.heightAnchor.constraint(equalToConstant: 150)
        productImages.contentMode = .scaleAspectFill
        productImages.backgroundColor = .red
        productImages.layer.borderWidth = 1
        productImages.layer.borderColor = UIColor.red.cgColor
        productImages.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

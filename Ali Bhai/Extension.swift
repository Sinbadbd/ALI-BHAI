//
//  Extension.swift
//  Ali Bhai
//
//  Created by sinbad on 3/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(cornerRadius : CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
}
extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines : Int = 0 ) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

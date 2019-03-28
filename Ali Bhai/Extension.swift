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

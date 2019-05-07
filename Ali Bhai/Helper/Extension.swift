//
//  Extension.swift
//  Ali Bhai
//
//  Created by sinbad on 3/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
extension UIColor {
    // rgb color formate
    convenience init(red: Int, green: Int, blue: Int){
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    //hex color formate
    convenience init(rgb: Int){
        self.init(
            red: (rgb >> 16 ) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    // static color formate
    static var blueZero : UIColor {return UIColor.init(rgb: 0x64E4FF)}
    static var blueOne : UIColor {return UIColor.init(rgb: 0x3A7BD5)}
    static var grayZero : UIColor {return UIColor.init(rgb: 0x9B9B9B)}
    static var grayOne : UIColor {return UIColor.init(rgb: 0x424242)}
}
extension UIImageView {
    
    convenience init(cornerRadius : CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
}
extension UILabel {
    convenience  init(title: String = "default text", color:UIColor = .white, size:CGFloat = 16, textAlign:NSTextAlignment = .left ,frame: CGRect = .zero) {
        self.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.text = title
        self.textColor = color
        self.font = UIFont(name: " " , size: size)
        self.textAlignment = textAlign
    }
}
extension String{
    func strikeThrough()->NSAttributedString{
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

extension String {
    func stripOutHtml() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
            return attributed.string
        } catch {
            return nil
        }
    }
}


extension UIButton {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
 

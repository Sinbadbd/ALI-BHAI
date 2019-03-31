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
//    let titlLabel = UILabel(text: "T-Shirt", font: UIFont.boldSystemFont(ofSize: 18 )  , numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        addSubview(appImage)
//
////        addSubview(titlLabel)
//        titlLabel.translatesAutoresizingMaskIntoConstraints = false
//        appImage.backgroundColor = .green
//        appImage.translatesAutoresizingMaskIntoConstraints = false
        
    
//        appImage = CGRect(x: 10, y: let, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
        
        
//        appImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        appImage.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        appImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
//        appImage.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        appImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
//        titlLabel.rightAnchor.constraint(equalTo: appImage.rightAnchor, constant: 70).isActive = true
//
        
        let imageV = UIImageView(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
        imageV.backgroundColor = .white
        addSubview(imageV)
        
        let titleLable = UILabel(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: 10, width: 230, height: 40))
        
        addSubview(titleLable)
        titleLable.backgroundColor = .yellow
        
        
        let titleDescription = UILabel(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: titleLable.frame.origin.y + titleLable.frame.height + 5, width: 230, height: 40))
        addSubview(titleDescription)
        titleDescription.backgroundColor = .green
        
        let leftPriveView = UIView(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y:  titleDescription.frame.origin.y + titleDescription.frame.height + 10, width: 110, height: 50))
        addSubview(leftPriveView)
        leftPriveView.backgroundColor = .blue
        
        let rightColorView = UIView(frame: CGRect(x: leftPriveView.frame.origin.x + leftPriveView.frame.width + 10, y: titleDescription.frame.origin.y + titleDescription.frame.height + 10, width: 110, height: 50))
        addSubview(rightColorView)
        rightColorView.backgroundColor = .blue
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

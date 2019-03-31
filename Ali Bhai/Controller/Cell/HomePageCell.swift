//
//  HomePageCell.swift
//  Ali Bhai
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class HomePageCell : UICollectionViewCell {
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageV = UIImageView(frame: CGRect(x: 10, y: 10, width: 150, height: 150))
        imageV.backgroundColor = .white
        addSubview(imageV)
        imageV.layer.cornerRadius = 12
        imageV.clipsToBounds = true
        imageV.contentMode = .scaleAspectFill
        
        let titleLable = UILabel(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: 10, width: 230, height: 30))
        
        addSubview(titleLable)
        titleLable.text = "Why do we use it?"
        titleLable.textColor = .black
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        
        let titleDescription = UILabel(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: titleLable.frame.origin.y + titleLable.frame.height, width: 230, height: 40))
        addSubview(titleDescription)
        titleDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
        titleDescription.textColor = .lightGray
        titleDescription.numberOfLines = 3
        titleDescription.font = UIFont(name: "", size: 12)
        
        let leftPriveView = UIView(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y:  titleDescription.frame.origin.y + titleDescription.frame.height + 10, width: 110, height: 50))
        addSubview(leftPriveView) 
        
        
        let strikPrice = UILabel(frame: CGRect(x: leftPriveView.frame.origin.x, y: leftPriveView.frame.origin.y , width: 100, height: 20))
        addSubview(strikPrice)
        strikPrice.attributedText = "$120".strikeThrough()
        strikPrice.textColor = .gray
        strikPrice.font = UIFont(name: "", size: 8)
        
        let orginalPrice = UILabel(frame: CGRect(x: leftPriveView.frame.origin.x, y: strikPrice.frame.origin.y + strikPrice.frame.height + 10 , width: 100, height: 20))
        addSubview(orginalPrice)
        orginalPrice.text = "$120"
        orginalPrice.textColor = #colorLiteral(red: 1, green: 0.3610824653, blue: 0.366276469, alpha: 1)
        orginalPrice.font = UIFont(name: "", size: 20)
        
        let rightColorView = UIView(frame: CGRect(x: leftPriveView.frame.origin.x + leftPriveView.frame.width + 10, y: titleDescription.frame.origin.y + titleDescription.frame.height + 10, width: 110, height: 50))
        addSubview(rightColorView)
        
        let colorLable = UILabel(frame: CGRect(x: rightColorView.frame.origin.x, y: rightColorView.frame.origin.y , width: 100, height: 20))
        addSubview(colorLable)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

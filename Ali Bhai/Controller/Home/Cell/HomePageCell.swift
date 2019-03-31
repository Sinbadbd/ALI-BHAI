//
//  HomePageCell.swift
//  Ali Bhai
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class HomePageCell : UICollectionViewCell {
    
    let imageV:UIImageView = UIImageView()  
    let titleLable:UILabel = UILabel()
    let strikPrice:UILabel = UILabel()
    let orginalPrice:UILabel = UILabel()
    let titleDescription:UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageV.frame = CGRect(x: 10, y: 10, width: 150, height: 150)
        addSubview(imageV)
        imageV.layer.cornerRadius = 12
        imageV.clipsToBounds = true
        imageV.contentMode = .scaleAspectFill
        imageV.layer.borderColor = UIColor.lightGray.cgColor
        imageV.layer.borderWidth = 1
        
        titleLable.frame = CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: 10, width: 230, height: 30)
        addSubview(titleLable)
        titleLable.text = "Why do we use it?"
        titleLable.textColor = .black
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        
        titleDescription.frame = CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y: titleLable.frame.origin.y + titleLable.frame.height, width: 230, height: 60)
        addSubview(titleDescription)
        titleDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
        titleDescription.backgroundColor = .red
        titleDescription.textColor = .black
        titleDescription.numberOfLines = 3
        titleDescription.font = UIFont(name: "", size: 12)
        
        let leftPriveView = UIView(frame: CGRect(x: imageV.frame.origin.x + imageV.frame.width + 10, y:  titleDescription.frame.origin.y + titleDescription.frame.height + 10, width: 110, height: 50))
        addSubview(leftPriveView) 
        
        
        strikPrice.frame = CGRect(x: leftPriveView.frame.origin.x, y: leftPriveView.frame.origin.y , width: 100, height: 20)
        addSubview(strikPrice)
        strikPrice.attributedText = "$120".strikeThrough()
        strikPrice.textColor = .gray
        strikPrice.font = UIFont(name: "", size: 8)
        
        orginalPrice.frame = CGRect(x: leftPriveView.frame.origin.x, y: strikPrice.frame.origin.y + strikPrice.frame.height + 10 , width: 100, height: 20)
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

//
//  IntroductionCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/20/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class IntroductionCell: UICollectionViewCell {
    
    let topImageViewContainer:UIView = UIView()
    let introImage:UIImageView = UIImageView()
    let descriptionTextView :UILabel = UILabel()
     
    var intro : Introduct? {
        didSet{
            guard let unwrapedPage = intro else {return}
            introImage.image = UIImage(named: unwrapedPage.imageName)
            descriptionTextView.text = intro?.headerText
           // intro?.bodyText = intro?.bodyText
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstrains()
    }
    
    func setupUI(){
        addSubview(topImageViewContainer)
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        /// self.view.addSubview(introImage)
        introImage.translatesAutoresizingMaskIntoConstraints = false
        introImage.contentMode = .scaleAspectFit
        introImage.image = #imageLiteral(resourceName: "grocery")
        
       addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        let attributeText = NSMutableAttributedString(string: "Join us", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSMutableAttributedString(string: "\n\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        descriptionTextView.attributedText = attributeText
        descriptionTextView.textAlignment = .center
        
        
    }
    
    func setupConstrains(){
        topImageViewContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageViewContainer.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        topImageViewContainer.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        topImageViewContainer.addSubview(introImage)
        introImage.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        introImage.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive  = true
        introImage.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor,  constant: 40).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor,  constant: -40).isActive = true
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

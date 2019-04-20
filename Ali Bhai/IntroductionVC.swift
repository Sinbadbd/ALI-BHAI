//
//  IntroductionVC.swift
//  Ali Bhai
//
//  Created by sinbad on 4/19/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class IntroductionVC : UIViewController {
    let topImageViewContainer:UIView = UIView()
    let introImage:UIImageView = UIImageView()
    let descriptionTextView :UILabel = UILabel()
    
    let prevButton:UIButton = UIButton()
    let nextButton:UIButton = UIButton()
    let pageController :UIPageControl = UIPageControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupConstrains()
    }
    
    func setupUI(){
        self.view.addSubview(topImageViewContainer)
        topImageViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        /// self.view.addSubview(introImage)
        introImage.translatesAutoresizingMaskIntoConstraints = false
        introImage.contentMode = .scaleAspectFit
        introImage.image = #imageLiteral(resourceName: "grocery")
        
        self.view.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        let attributeText = NSMutableAttributedString(string: "Join us", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributeText.append(NSMutableAttributedString(string: "\n\n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        descriptionTextView.attributedText = attributeText
        descriptionTextView.textAlignment = .center
        
        
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        prevButton.layer.cornerRadius = 6
        //  prevButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), for: .normal)
        //        nextButton.backgroundColor = .red
        nextButton.setGradientButton(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
        nextButton.layer.cornerRadius = 6
        
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        //uiView2.backgroundColor = .green
        pageController.currentPage = 0
        pageController.numberOfPages = 4
        pageController.currentPageIndicatorTintColor = UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1)
        pageController.pageIndicatorTintColor = .gray
        
        let stackView = UIStackView(arrangedSubviews: [prevButton,pageController,nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupConstrains(){
        topImageViewContainer.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageViewContainer.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        topImageViewContainer.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageViewContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageViewContainer.addSubview(introImage)
        introImage.centerXAnchor.constraint(equalTo: topImageViewContainer.centerXAnchor).isActive = true
        introImage.centerYAnchor.constraint(equalTo: topImageViewContainer.centerYAnchor).isActive  = true
        introImage.heightAnchor.constraint(equalTo: topImageViewContainer.heightAnchor, multiplier: 0.5).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageViewContainer.bottomAnchor, constant: 50).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor,  constant: 40).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor,  constant: -40).isActive = true
        
        
    }
    
}

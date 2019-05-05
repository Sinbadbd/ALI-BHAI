//
//  SwipingController.swift
//  Ali Bhai
//
//  Created by sinbad on 4/20/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class SwipingController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let CELL = "CELL"
    let prevButton:UIButton = UIButton()
    let nextButton:UIButton = UIButton()
   // let pageController :UIPageControl = UIPageControl()
    
    
    let intro = [
    
        Introduct(imageName: "grocery", headerText: "Join 1", bodyText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500"),
        Introduct(imageName: "grocery", headerText: "Join us 2", bodyText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500"),
        Introduct(imageName: "grocery", headerText: "Join us 3", bodyText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's   the 1500"),
        Introduct(imageName: "grocery", headerText: "Join us 4", bodyText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500")
    ]
    
    lazy var pageController : UIPageControl = {
        let pageController = UIPageControl()
        pageController.translatesAutoresizingMaskIntoConstraints = false
        //uiView2.backgroundColor = .green
        pageController.currentPage = 0
        pageController.numberOfPages = intro.count
        pageController.currentPageIndicatorTintColor = UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1)
        pageController.pageIndicatorTintColor = .gray
        
        return pageController
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(IntroductionCell.self, forCellWithReuseIdentifier: CELL)
        collectionView.isPagingEnabled = true
        
        
        
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        prevButton.layer.cornerRadius = 6
        prevButton.addTarget(self, action: #selector(prevButtonClicked), for: .touchUpInside)
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), for: .normal)
        nextButton.setGradientButton(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
        nextButton.layer.cornerRadius = 6
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
        
        
        let stackView = UIStackView(arrangedSubviews: [prevButton,pageController,nextButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

   
    @objc func prevButtonClicked(){
        let nextIndex = max(pageController.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageController.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func nextButtonClicked(){
        let nextIndex = min(pageController.currentPage + 1, intro.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
      
        if ((indexPath.lastIndex(of: 3)) != nil) { 
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(handleHomePage), userInfo: nil, repeats: false)
              print(indexPath)
        }
        pageController.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    let user = UserDefaults.standard
    @objc func handleHomePage(){
        let homePage = BaseTabController()
        //let homePage = HomeViewController()
        self.present(homePage, animated: true, completion: nil)
        user.set(true, forKey: "splash")
        user.synchronize()
        print("save-splash\(user)")
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x / view.frame.width)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return intro.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! IntroductionCell
        let data = intro[indexPath.item]
        cell.intro = data
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

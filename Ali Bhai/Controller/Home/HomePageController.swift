//
//  HomePageController.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class HomePageController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let CATEGORY_CELL =  "CATEGORY_CELL"
    let PRODUCT_CELL = "PRODUCT_CELL"
    let HOME_IMAGE_CELL = "HOME_IMAGE_CELL"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.backgroundColor = .clear
        return cv
    }()
    
    func setupViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CATEGORY_CELL)
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: PRODUCT_CELL)
        collectionView.register(HomeImageSliderCell.self, forCellWithReuseIdentifier: HOME_IMAGE_CELL)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init())
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 4
        } else {
            return 9
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOME_IMAGE_CELL, for: indexPath) as! HomeImageSliderCell
            return cell
            
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CATEGORY_CELL, for: indexPath) as! CategoryCell
            cell.backgroundColor = .green
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PRODUCT_CELL, for: indexPath) as! ProductCell
            cell.backgroundColor = .red
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width, height: 300)
        } else if indexPath.section == 1 {
            return CGSize(width: (view.frame.width) / 4 - 16, height: 40)
        } else {
            return CGSize(width: (view.frame.width) / 2 - 16 , height: 200)
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 0, left: 8, bottom: 10, right: 8)
        } else if section == 1 {
            
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        } else {
            
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
    }
}



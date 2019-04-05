//
//  CategoryCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let categoryHeading:UILabel = UILabel(title: "Category", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 18)
    let sellAll:UILabel = UILabel(title: "Sell All", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 14)
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        let collectionV  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    let CELL = "CELL"
    
    func setupUI(){
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryContentCell.self, forCellWithReuseIdentifier: CELL)
        
        addSubview(categoryHeading)
        categoryHeading.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        addSubview(sellAll)
        sellAll.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        
        addSubview(collectionView)
        collectionView.anchor(top: categoryHeading.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! CategoryContentCell
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width) / 4 - 16, height: 100)
    }
    
    private class CategoryContentCell : UICollectionViewCell {
        let imageCat:UIImageView = UIImageView()
        let categoryTitle:UILabel = UILabel(title: "Sell All", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 14)
        override init(frame: CGRect) {
            super.init(frame: frame)
            backgroundColor = .red
 
            addSubview(imageCat)
            imageCat.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(), size: CGSize(width: 60, height: 60))
            imageCat.backgroundColor = .blue
            imageCat.contentMode = .scaleAspectFill
            
            addSubview(categoryTitle)
            categoryTitle.anchor(top: imageCat.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 0, left: 5, bottom: 0, right: 0))
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

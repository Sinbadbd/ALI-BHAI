//
//  CategoryCell.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class CategoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let categoryHeading:UILabel = UILabel(title: "Category", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 18)
    let sellAll:UILabel = UILabel(title: "Sell All", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 14)
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        let collectionV  = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionV
    }()
    
    
    var category = [Category]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        apiData()
    }
    
    func apiData (){
        // print("----------")
        ApiClient.getAllCategory { (response, error) in
            if let response = response {
                self.category = response
                // print(response)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    let CELL = "CELL"
    
    func setupUI(){
        collectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryContentCell.self, forCellWithReuseIdentifier: CELL)
        
        addSubview(categoryHeading)
        categoryHeading.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 10, bottom: 0, right: 0))
        addSubview(sellAll)
        sellAll.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        
        addSubview(collectionView)
        collectionView.anchor(top: categoryHeading.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 0))
    }
    
    // change background color when user touches cell
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.red
    }
    
    // change background color back when user releases touch
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    var selectedIndex = Int ()
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! CategoryContentCell
        let apiData   = category[indexPath.item]
        cell.categoryTitle.text = apiData.name
        let url = URL(string: apiData.image.src)
        // print(url)
        cell.imageCat.kf.setImage(with: url)
        //cell.backgroundColor = selectedIndex == indexPath.item ? UIColor.green : UIColor.red
        
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width) / 4 - 16, height: 120)
    }
    
    private class CategoryContentCell : UICollectionViewCell {
        let imageCat:UIImageView = UIImageView()
        let categoryTitle:UILabel = UILabel(title: "Title", color: UIColor.init(red: 0, green: 0, blue:0, alpha: 1), size: 12)
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageCat)
            imageCat.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 20, right: 20), size: CGSize(width: 20, height: 20))
            imageCat.contentMode = .scaleAspectFill
            
            addSubview(categoryTitle)
            categoryTitle.anchor(top: imageCat.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 10, left: 5, bottom: 0, right: 0))
            categoryTitle.numberOfLines = 1
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

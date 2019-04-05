//
//  h.swift
//  Ali Bhai
//
//  Created by sinbad on 4/4/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class HomeImageSliderCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let CELL = "CELL"
    
    var productImages = [ImagesAll]()
    var products = [Products]()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        fetchAPi()
        
    }
    func fetchAPi(){
        ApiClient.getAllProducts { (response, error) in
           
            if let response = response {
                 self.products = response
                self.productImages = response[0].images
            }
           
            DispatchQueue.main.async { 
                self.collectionView.reloadData()
            }
        }
        
    }
    func setupUI () {
        
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        addSubview(collectionView)
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: CELL)
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init())
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL, for: indexPath) as! ImageCell
        let apiData = products[indexPath.item]
        let url = URL(string: apiData.images[0].src)
        cell.imageView.kf.setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -34)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private class ImageCell : UICollectionViewCell {
        let imageView : UIImageView = {
            let image = UIImageView()
            image.layer.cornerRadius = 12
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            return image
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageView)
            imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

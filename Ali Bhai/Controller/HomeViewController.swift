//
//  HomeViewController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class HomeViewController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let CELL_ID = "CELL_ID"
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        collectionView.backgroundColor = .white
        setupSearchController()
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: CELL_ID)
      
    }
    
    func setupSearchController(){
        definesPresentationContext = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! HomePageCell
        cell.backgroundColor = .red
        return cell
        
    }
    
   
    
}

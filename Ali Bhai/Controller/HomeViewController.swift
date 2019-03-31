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
    var apiResponse = ApiClient()
    
    var product : [Products]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        setupSearchController()
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: CELL_ID)
        fetchProduct()
    }
    
    
    func fetchProduct () {
        ApiClient.getAllProducts { (response, data) in
            if let response = response {
                print(response)
                self.collectionView.reloadData()
            }
        }
        print("hah")
    }
    
    func setupSearchController(){
        definesPresentationContext = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! HomePageCell
        cell.appImage
        return cell
        
    }
    
    
    
}

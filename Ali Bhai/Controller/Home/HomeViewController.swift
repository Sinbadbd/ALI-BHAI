//
//  HomeViewController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
import Kingfisher
import SVProgressHUD

class HomeViewController: BaseListController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let CELL_ID = "CELL_ID"
    var apiResponse = ApiClient()
    
    var product = [Products]()
    //var products : Products?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        setupSearchController()
        collectionView.register(HomePageCell.self, forCellWithReuseIdentifier: CELL_ID)
        fetchProduct()
    }
    
    
    func fetchProduct () {
        SVProgressHUD.show()
        ApiClient.getAllProducts { (response, data) in
            if let response = response {
                self.product = response
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            SVProgressHUD.dismiss()
        }
    }
    
    func setupSearchController(){
        definesPresentationContext = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selected = product[indexPath.item]
        let detailsControler = ProductDetailsController()
        detailsControler.productId = selected.id
        self.navigationController?.pushViewController(detailsControler, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 175)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count xxxx \(String(describing: product.count))")
        return product.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as! HomePageCell
        let apiData = product[indexPath.item]
        cell.titleLable.text = apiData.name
        cell.orginalPrice.text = apiData.price
        cell.strikPrice.text =  apiData.sale_price
        cell.titleDescription.text = apiData.short_description
        let url = URL(string: apiData.images[0].src)
        cell.imageV.kf.setImage(with: url)
        return cell
        
    }
    
}

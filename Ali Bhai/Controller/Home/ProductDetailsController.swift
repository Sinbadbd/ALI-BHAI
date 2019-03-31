//
//  ProductDetailsController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class ProductDetailsController : BaseListController, UICollectionViewDelegateFlowLayout{
    
    var product : Products?
    
  //  var prod  = [Products]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var id = product?.id
        
        collectionView.backgroundColor = .white
       
        ApiClient.getProdutsId(id: id ) { (response, error) in
            print("haha")
            self.product = response
            print(self.product = response)
        }
        
    }
    
}

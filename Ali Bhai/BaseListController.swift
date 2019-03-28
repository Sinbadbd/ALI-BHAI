//
//  BaseListController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class BaseListController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout()) 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

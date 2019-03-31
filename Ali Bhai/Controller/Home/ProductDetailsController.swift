//
//  ProductDetailsController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/31/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class ProductDetailsController : UIViewController{
    
    var product : Products?
    var productId : Int! {
        didSet {
            print("app id", productId)
        }
    }
    
    let imageV:UIImageView = UIImageView()
    let titleLable:UILabel = UILabel()
    let strikPrice:UILabel = UILabel()
    let orginalPrice:UILabel = UILabel()
    let titleDescription:UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // var id = product?.id
        titleLable.frame = CGRect(x: 0, y: 0, width: 300, height: 200)
        
        view.addSubview(titleLable)
        titleLable.text = " "
        titleLable.textColor = .black
        titleLable.backgroundColor = .red
        titleLable.font = UIFont.boldSystemFont(ofSize: 18)
        
        view.backgroundColor = .white
        ApiClient.getProdutsId(id: productId ) { (response, error) in
            // print("haha")
            self.product = response
            print(response?.id, response?.name)
            DispatchQueue.main.async {
                self.titleLable.text = response?.name 
            }
        }
     self.viewWillAppear(true)
        self.view.setNeedsDisplay()
    }
    
 
    
    
}

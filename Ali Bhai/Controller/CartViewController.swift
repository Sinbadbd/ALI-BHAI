//
//  CartViewController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/28/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    var list = ["A", "B","C", "D"]
    let CART_ID = "CART_ID"
    let cartTabelView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(cartTabelView)
        
        
//        cartTabelView.estimatedRowHeight = 500
//        cartTabelView.rowHeight = UITableView.automaticDimension
        
        cartTabelView.delegate = self
        cartTabelView.dataSource = self
        cartTabelView.register(CartTableViewCell.self, forCellReuseIdentifier: CART_ID)
        cartTabelView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        cartTabelView.layoutMargins = .zero
        cartTabelView.separatorInset = .zero
        
        
        
        cartTabelView.layoutIfNeeded()
    }
}

extension CartViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTabelView.dequeueReusableCell(withIdentifier: CART_ID, for: indexPath) as! CartTableViewCell
       // cell.textLabel?.text = list[indexPath.item]
        cell.selectionStyle = .none
        return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
}

//
//  CartTableViewCell.swift
//  Ali Bhai
//
//  Created by sinbad on 5/13/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    let cartImage:UIImageView = UIImageView()
    let cartProductTitle:UILabel = UILabel()
    let cartProductPrice:UILabel = UILabel()
    let cartDeleteButton:UIButton = UIButton(type: .system)
    
    let cartQtyTextLable:UILabel = UILabel()
    let cartMinusButton:UIButton = UIButton()
    let cartPlusButton:UIButton = UIButton()
    let cartQtyTextField:UITextView = UITextView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCartUI()
    }
    
    func setupCartUI(){
        addSubview(cartImage)
        cartImage.translatesAutoresizingMaskIntoConstraints = false
        cartImage.image = #imageLiteral(resourceName: "grocery")
        cartImage.contentMode = .scaleAspectFit
        cartImage.layer.cornerRadius = 8
        //cartImage.backgroundColor = .red
        cartImage.anchor(top:topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: .init(top: 10, left: 5, bottom: 5, right: 5), size: CGSize(width: 150, height: 100))
        //cartImage.centerXInSuperview()
        
        addSubview(cartProductTitle)
        cartProductTitle.translatesAutoresizingMaskIntoConstraints = false
        cartProductTitle.font = UIFont.boldSystemFont(ofSize: 24)
        cartProductTitle.anchor(top: topAnchor, leading: cartImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 10, right: 0), size: CGSize(width: 200, height: cartProductTitle.frame.height))
        cartProductTitle.numberOfLines = 0
      //  cartProductTitle.backgroundColor = .green
        cartProductTitle.text = "Override this method when the rows"
    
        
        
        addSubview(cartProductPrice)
        cartProductPrice.translatesAutoresizingMaskIntoConstraints = false
        cartProductPrice.anchor(top: cartProductTitle.bottomAnchor, leading: cartImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0))
       // cartProductPrice.backgroundColor = .red
        cartProductPrice.text = "BDT 100000"
        
        addSubview(cartDeleteButton)
        cartDeleteButton.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
        cartDeleteButton.translatesAutoresizingMaskIntoConstraints = false
        cartDeleteButton.anchor(top: topAnchor, leading: cartProductTitle.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 5, bottom: 0, right: 0), size: CGSize(width: 30, height: 30))
        cartDeleteButton.addTarget(self, action: #selector(handleCartItemDelete), for:  .touchUpInside)
       // cartDeleteButton.backgroundColor = .red
 
        
        cartQtyTextLable.translatesAutoresizingMaskIntoConstraints = false
        cartQtyTextLable.text = "Qty"
        
        cartMinusButton.translatesAutoresizingMaskIntoConstraints = false
        cartMinusButton.setImage(#imageLiteral(resourceName: "minus"), for: .normal)
        cartMinusButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cartMinusButton.layer.borderWidth = 1
        cartMinusButton.addTarget(self, action: #selector(handlezMinusBtn), for: .touchUpInside)
        
        
        cartQtyTextField.translatesAutoresizingMaskIntoConstraints = false
        cartQtyTextField.text = "1"
        cartQtyTextField.textAlignment = .center
        cartQtyTextField.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cartQtyTextField.layer.borderWidth = 1
        
        cartPlusButton.translatesAutoresizingMaskIntoConstraints = false
        cartPlusButton.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        cartPlusButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cartPlusButton.layer.borderWidth = 1
        cartPlusButton.addTarget(self, action: #selector(handlePlusBtn), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews:[cartQtyTextLable,cartMinusButton,cartQtyTextField,cartPlusButton])
         addSubview(stackView)
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .yellow
        stackView.anchor(top: cartProductPrice.bottomAnchor, leading: cartImage.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 20, bottom: 0, right: 0), size: CGSize(width: 130, height: 30))
        
    }
    var count = 0
    
    @objc func handlePlusBtn(){
        if count > 10 {
           print("max \(count)")
        } else {
            self.count += 1
            self.cartQtyTextField.text = "\(self.count)"
        }
        
    }
    
    @objc func handlezMinusBtn(){
        if count < 0  {
            print("Minus")
        } else {
            self.count -= 1
            self.cartQtyTextField.text = "\(self.count)"
        }
    }
    
    @objc func handleCartItemDelete(){
        print("delete")
    }
    
    
//    func showToast( message: String, seconds : Double) {
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alert.view.backgroundColor = UIColor.black
//        alert.view.alpha = 0.6
//        alert.view.layer.cornerRadius = 15
//
//
//        present(alert, animated: true)
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
//            alert.dismiss(animated: true)
//        }
//    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

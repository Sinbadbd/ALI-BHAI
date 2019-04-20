//
//  SplashScreen.swift
//  Ali Bhai
//
//  Created by sinbad on 4/19/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class SplashScreen: UIViewController {
    let imgView = UIImageView()
    let bgVIew = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bgVIew)
        bgVIew.translatesAutoresizingMaskIntoConstraints = false
        bgVIew.frame = CGRect(x: 0, y: 0, width: view.frame.width, height:view.frame.height)
        
        bgVIew.setGradientBackground(colorTop: UIColor(red: 246/255, green: 130/255, blue: 139/255, alpha: 1), colorBottom: UIColor(red: 250/255, green: 166/255, blue: 119/255, alpha: 1))
        
        view.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        
        imgView.image = #imageLiteral(resourceName: "ali")
        
        self.view.addConstraints([
            imgView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgView.widthAnchor.constraint(equalToConstant: 200),
            imgView.heightAnchor.constraint(equalToConstant: 200),
            
            ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.9, animations: {() -> Void in
            self.imgView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.imgView.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
        
    }
    
}

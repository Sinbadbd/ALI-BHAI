//
//  BaseTabController.swift
//  Ali Bhai
//
//  Created by sinbad on 3/27/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import UIKit
class BaseTabController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad() 
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 5
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.7
        
        
        viewControllers = [
         createNavController(viewController: HomePageController(), title: "Home", imageView: "home"),
         //   createNavController(viewController: HomeViewController(), title: "Home", imageView: "home"),
            createNavController(viewController: CartViewController(), title: "Cart", imageView: "cart"),
            createNavController(viewController: FavoriteViewController(), title: "Favorite", imageView: "heart"),
            createNavController(viewController: MoreViewController(), title: "More", imageView: "menu")
        ]
    }
 
}

func createNavController (viewController : UIViewController, title: String, imageView: String) -> UIViewController {
    
    viewController.view.backgroundColor = .white
    viewController.navigationItem.title = title
    let navController = UINavigationController(rootViewController: viewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = UIImage(named: imageView)
    return navController
}

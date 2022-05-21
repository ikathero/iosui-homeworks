//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 10.05.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let colorSet = UIColor(hex: 0x4885CC)
    let feedVC = FeedViewController()
    let logInVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.tintColor = UIColor(ciColor: .init(color: colorSet))
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNavController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")
        feedVC.navigationItem.title = "Feed"
        
        let logNavController = UINavigationController(rootViewController: logInVC)
        logInVC.tabBarItem.title = "Profile"
        logInVC.tabBarItem.image = UIImage(systemName: "person.fill")
        logInVC.navigationController?.isNavigationBarHidden = true
        logInVC.navigationItem.title = "Profile"
        
        viewControllers = [feedNavController, logNavController]
    }

}

// MARK: - перевод цвета из HEX в RGB для UIColor

 extension UIColor {
     convenience init(hex: Int) {
         let components = (
             R: CGFloat((hex >> 16) & 0xff) / 255,
             G: CGFloat((hex >> 08) & 0xff) / 255,
             B: CGFloat((hex >> 00) & 0xff) / 255
         )
         self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
     }
 }

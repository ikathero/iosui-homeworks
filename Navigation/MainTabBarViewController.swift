//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 10.05.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
//        UINavigationBar.appearance().backgroundColor = UIColor.white
//        // UIBarButtonItem.appearance().tintColor = UIColor.lightGray - цвет кнопок
//        UITabBar.appearance().backgroundColor = UIColor.white

        setupControllers()
    }
    
    private func setupControllers() {
        let firstNavController = UINavigationController(rootViewController: feedVC)
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "house.fill")
        feedVC.navigationItem.title = "Feed"
        
        let secondNavController = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle.fill")
        profileVC.navigationItem.title = "Profile"
        
        viewControllers = [firstNavController, secondNavController]
    }

}

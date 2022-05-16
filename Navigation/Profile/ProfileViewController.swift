//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 16.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHV = ProfileHeaderView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6 // окрашивает общий фон
        profileHV.backgroundColor = .lightGray // окрашивает только safe area
        viewWillLayoutSubviews()
    }

   override func viewWillLayoutSubviews() {
       profileHV.frame = view.safeAreaLayoutGuide.layoutFrame
            view.addSubview(profileHV)
        }
}

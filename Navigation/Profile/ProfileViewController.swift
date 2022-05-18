//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 16.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6 // окрашивает общий фон
        setupLayout()
    }

    private let profileHV: ProfileHeaderView = {
        let profileHV = ProfileHeaderView()
        profileHV.backgroundColor = .lightGray // окрашивает рамку
        profileHV.translatesAutoresizingMaskIntoConstraints = false
             return profileHV
         }()
    
    private func setupLayout() {
        view.addSubview(profileHV)
        
        NSLayoutConstraint.activate([
            // рамка
            profileHV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHV.heightAnchor.constraint(equalToConstant: 220)])
    }

}

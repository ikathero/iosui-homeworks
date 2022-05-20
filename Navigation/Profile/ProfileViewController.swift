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
    
    private lazy var newButton: UIButton = {
             let newButton = UIButton()
             newButton.translatesAutoresizingMaskIntoConstraints = false
             newButton.backgroundColor = .systemOrange
             newButton.setTitle("Tap me", for: .normal)
             newButton.setTitleColor(UIColor.white, for: .normal)
             newButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
             return newButton
         }()

    @objc private func tapAction() {
             print("The user pressed the button 'Tap me'")
    }
    
    private func setupLayout() {
        view.addSubview(profileHV)
        view.addSubview(newButton)
        
        NSLayoutConstraint.activate([
            // рамка
            profileHV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHV.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHV.heightAnchor.constraint(equalToConstant: 220),
            // кнопка
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}

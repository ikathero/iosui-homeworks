//
//  FeedViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 10.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.layer.shadowOffset = CGSize(width: 4, height: 4)
        stackView.layer.shadowRadius = 4.0
        stackView.layer.shadowColor = UIColor.black.cgColor
        stackView.layer.shadowOpacity = 0.7
        return stackView
    }()
    
    private let firstButton: UIButton = {
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = .systemBlue
        firstButton.layer.cornerRadius = 12
        firstButton.clipsToBounds = true
        firstButton.setTitle("Good news", for: .normal)
        firstButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return firstButton
    }()
    
    private let secondButton: UIButton = {
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = .systemPink
        secondButton.layer.cornerRadius = 12
        secondButton.clipsToBounds = true
        secondButton.setTitle("Something else", for: .normal)
        secondButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return secondButton
    }()
    
    private func layout() {
        view.addSubview(stackView)
        [firstButton, secondButton].forEach {stackView.addArrangedSubview($0)}
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
        
        NSLayoutConstraint.activate([
        // happyButton
        firstButton.heightAnchor.constraint(equalToConstant: 50),
        // sadButton
        secondButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.navigationItem.title = postVC.post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
}

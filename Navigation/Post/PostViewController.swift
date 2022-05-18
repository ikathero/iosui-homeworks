//
//  PostViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 10.05.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post = Post(title: "Post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        makeBarItem()
    }
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barItem
    }
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}

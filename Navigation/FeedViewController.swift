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
        makeButton()
    }
    
    private func makeButton() {
        let buttonPost = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        buttonPost.center = view.center
        buttonPost.setTitle("Post", for: .normal)
        buttonPost.backgroundColor = .systemBlue
        buttonPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        buttonPost.layer.cornerRadius = 12
        buttonPost.clipsToBounds = true
        view.addSubview(buttonPost)
        
    }

    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.navigationItem.title = postVC.post.title
        navigationController?.pushViewController(postVC, animated: true)
    }
}

//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 16.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let post: [Post] = Post.makePost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6 // окрашивает общий фон
        setupLayout()
    }

    private let profileHV: ProfileHeaderView = {
        let profileHV = ProfileHeaderView()
        profileHV.backgroundColor = .systemGray6
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        return profileHV
    }()

    private func setupLayout() {

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

// MARK: - UITableViewDelegate

 extension ProfileViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         UITableView.automaticDimension
     }

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let profileHeader = ProfileHeaderView()
         return profileHeader
     }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 220
     }
 }

// MARK: - UITableViewDataSource

 extension ProfileViewController: UITableViewDataSource {

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return post.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
         cell.setupCell(post[indexPath.row])
         return cell
     }
 }

// MARK: - UIView

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

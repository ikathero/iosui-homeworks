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
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6 // окрашивает общий фон
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private let profileHV: ProfileHeaderView = {
        let profileHV = ProfileHeaderView()
        profileHV.backgroundColor = .systemGray6
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        return profileHV
    }()

    private func setupLayout() {
        view.addSubview(tableView)

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
         return section == 0 ? profileHeader : nil
     }

     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return section == 0 ? 220 : 0
     }
 }

// MARK: - UITableViewDataSource

 extension ProfileViewController: UITableViewDataSource {
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return 2
     }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return section == 0 ? 1 : post.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if indexPath.section == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
             return cell
         } else {
             let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                      cell.setupCell(post[indexPath.row])
             return cell
         }
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if indexPath.section == 0 {
             self.navigationController?.pushViewController(PhotosViewController(), animated: true)
             self.navigationItem.backButtonTitle = "Back"
         } else { return
         }
     }
 }

// MARK: - UIView

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

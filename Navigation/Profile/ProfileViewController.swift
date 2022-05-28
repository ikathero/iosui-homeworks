//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 16.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var posts: [Post] = Post.makePost()
    
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
         return section == 0 ? 1 : posts.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         if indexPath.section == 0 {
             let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
             cell.delegate = self // открытие через делегат по стрелке
             return cell
         } else {
             let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
             let post = posts[indexPath.row]
             cell.post = post
             cell.onLikeTap = { post in
                 self.posts[indexPath.row] = post
                 cell.post = post
             }
             
             let fullPVC = FullPostViewController()
             cell.onImageViewTap = { post in
                 self.posts[indexPath.row] = post
                 cell.post = post
                 self.navigationController?.present(fullPVC, animated: true)
                 fullPVC.postImageView.image = UIImage(named: post.image)
                 fullPVC.descriptionLabel.text = post.description
                 fullPVC.likesLabel.text = "Likes: \(String(post.likes))"
                 fullPVC.viewsLabel.text = "Views: \(String(post.views))"
             }
             
                cell.setupCell(posts[indexPath.row])
             
             return cell
         }
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // Открытие по тапу на ячейку
//         if indexPath.section == 0 {
//             self.navigationController?.pushViewController(PhotosViewController(), animated: true)
//             self.navigationItem.backButtonTitle = "Back"
//         } else { return
//         }
     }
 }

// MARK: - UIView

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

// MARK: - PhotosViewDelegate

protocol PhotosTableViewDelegate: AnyObject {
    func rightArrowImagePressed()
}

extension ProfileViewController: PhotosTableViewDelegate {
    func rightArrowImagePressed() {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}

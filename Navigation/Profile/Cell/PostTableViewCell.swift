//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var onLikeTap: ((_ post: Post) -> ())?
    var onImageViewTap: ((_ post: Post) -> ())?
    
    var post: Post?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        customizeCell()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let postView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()

    private let postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    private func setupGestures() {
        let tapGestureLike = UITapGestureRecognizer(target: self, action: #selector(tapLike))
        likesLabel.addGestureRecognizer(tapGestureLike)
        let tapGesturesPost = UITapGestureRecognizer(target: self, action: #selector(tapFullImage))
        postImageView.addGestureRecognizer(tapGesturesPost)
    }
    
    @objc func tapLike() {
        if var post = self.post {
            post.likes = post.likes + 1
            likesLabel.text = "Likes: \(post.likes)"
            onLikeTap?(post)
            return
        }
    }
    
    @objc func tapFullImage() {
        if var post = self.post {
            post.views = post.views + 1
            viewsLabel.text = "Views: \(post.views)"
            onImageViewTap?(post)
            return
        }
    }
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    func setupCell(_ post: Post) {
        authorLabel.text = post.author
        descriptionLabel.text = post.description
        postImageView.image = UIImage(named: post.image)
        likesLabel.text = "Likes: \(post.likes)"
        viewsLabel.text = "Views: \(post.views)"
    }

    private func customizeCell() {
        postView.layer.cornerRadius = 0
        postView.layer.borderWidth = 0
        postView.layer.borderColor = UIColor.black.cgColor
    }

    private func setupLayout() {
        [postView, authorLabel, descriptionLabel, postImageView, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }

        let inset: CGFloat = 16

        NSLayoutConstraint.activate([
            
            // PostView
            postView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // AuthorLabel
            authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            authorLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            
            // PostImageView
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImageView.widthAnchor.constraint(equalTo: postView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            // DescriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            
            // LikesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            likesLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
            
            // ViewsLabel
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            viewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor, constant: -inset),
            ])
        }
}

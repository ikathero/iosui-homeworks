//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
      
    private var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 0
        view.clipsToBounds = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ photo: Photos) {
        photoImageView.image = UIImage(named: photo.image)
    }

    private func setupLayout() {
        contentView.addSubview(photoImageView)

        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
    }

}

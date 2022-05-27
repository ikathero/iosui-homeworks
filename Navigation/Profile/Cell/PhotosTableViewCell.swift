//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    private var rightArrowImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.sizeToFit()
        view.clipsToBounds = true
        view.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return view
    }()
    
    private var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .horizontal
        $0.spacing = 8
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
        $0.layer.borderColor = UIColor.lightGray.cgColor
        return $0
    }(UIStackView())

    private var firstImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "1")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private var secondImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "2")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private var thirdImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "3")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    private var fourthImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "4")
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {

        [firstImageView, secondImageView, thirdImageView, fourthImageView].forEach {stackView.addArrangedSubview($0) }

        [photosView, titleLabel, rightArrowImageView, stackView].forEach {contentView.addSubview($0) }

        NSLayoutConstraint.activate([
            // PhotosView
            photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // TitleLabel
            titleLabel.topAnchor.constraint(equalTo: photosView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -12),
           
            // RightArrowImageView
            rightArrowImageView.topAnchor.constraint(equalTo: photosView.topAnchor, constant: 12),
            rightArrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -12),
            
            // StackView
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -12),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (12 * 3 + 8 * 3)) / 4),
            stackView.bottomAnchor.constraint(equalTo: photosView.bottomAnchor, constant: -12)
             ])

         }
}

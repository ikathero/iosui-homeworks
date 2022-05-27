//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText = String()

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupLayout()
            setupGestures()
         }

         required init?(coder: NSCoder) {
             super.init(coder: coder)
         }

    lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "pic")
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.backgroundColor = .systemBackground
        avatarImageView.layer.cornerRadius = 55.0
        avatarImageView.layer.borderWidth = 3.0
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private lazy var blackoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.0
        return view
    }()
    
    private lazy var closeImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .systemGray6
        button.alpha = 0
        button.imageView?.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5)
        button.addTarget(self, action: #selector(closeImageAction), for: .touchUpInside)
        return button
    }()
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapImageAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapImageAction() {
        imagePosition = avatarImageView.layer.position
        imageBounds = avatarImageView.layer.bounds
    
        let centerScreen = UIScreen.main.bounds.height / 2 - 55 // 55 - половина высоты аватара
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) { [self] in
            self.blackoutView.alpha = 0.80
            self.avatarImageView.center.y = centerScreen
            self.avatarImageView.center.x = blackoutView.center.x
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0.1
            self.avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0.0) {
                    self.layoutIfNeeded()
                    self.closeImageButton.alpha = 1
                }
            }
    }
    
    private lazy var imagePosition = avatarImageView.layer.position
    private lazy var imageBounds = avatarImageView.layer.bounds
    
    @objc private func closeImageAction() {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) {
            self.blackoutView.alpha = 0.0
            self.avatarImageView.layer.position = self.imagePosition
            self.avatarImageView.layer.bounds = self.imageBounds
            self.avatarImageView.layer.cornerRadius = self.avatarImageView.bounds.width / 2
            self.closeImageButton.alpha = 0
            self.layoutIfNeeded()
        }
    }
    
    lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.text = "Venediktova Kate"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return fullNameLabel
    }()

    lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.isUserInteractionEnabled = false
        return statusLabel
    }()

    lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        let colorButton = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.backgroundColor = colorButton
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(UIColor.white, for: .normal)
        setStatusButton.layer.cornerRadius = 12.0
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return setStatusButton
    }()

    @objc private func buttonPressed() {
        if statusTextField.text != "" {
            statusLabel.text = statusText
            self.statusTextField.layer.borderColor = UIColor.black.cgColor
            statusTextField.text = ""
            statusTextField.placeholder = "Enter text here ..."
        } else {
            UIView.animate(
            withDuration: 2.5,
            delay: 0,
            usingSpringWithDamping: 0.1,
            initialSpringVelocity: 0.1,
            options: .curveEaseInOut) {
            self.statusTextField.placeholder = "Can't be empty"
            self.statusTextField.layer.borderColor = UIColor.systemRed.cgColor
            }
        }
        self.endEditing(true)
        print(statusText)
    }
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.indent(size: 10)
        statusTextField.placeholder = "Enter text here ..."
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderWidth = 1.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12.0
        statusTextField.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
        return statusTextField
    }()
    
    @objc private func statusTextChanges() {
        statusText = statusTextField.text!
        print(statusTextField)
    }
    
    private func setupLayout() {
        [fullNameLabel, statusLabel, setStatusButton, statusTextField, blackoutView, avatarImageView, closeImageButton].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            // BlackoutView
            blackoutView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            blackoutView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            blackoutView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            blackoutView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            // AvatarImage
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            
            // FullName
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // StatusLabel
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -68),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // StatusText
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // SetStatus
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            // CloseImage
            closeImageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            closeImageButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

}

// MARK: UITextField

extension UITextField {
     func indent(size:CGFloat) {
         self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
         self.leftViewMode = .always
     }
}

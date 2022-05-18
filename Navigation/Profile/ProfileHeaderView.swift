//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Venediktova Kate on 16.05.2022.
//

import UIKit

extension UITextField {
     func indent(size:CGFloat) {
         self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
         self.leftViewMode = .always
     }
 }

class ProfileHeaderView: UIView {
    
    private var statusText = String()

    override init(frame: CGRect) {
             super.init(frame: frame)
             setupLayout()
         }

         required init?(coder: NSCoder) {
             super.init(coder: coder)
         }

         lazy var avatarImageView: UIImageView = {
             let avatar = UIImage(named: "pic")
             let avatarImageView = UIImageView()
             avatarImageView.translatesAutoresizingMaskIntoConstraints = false
             avatarImageView.clipsToBounds = true
             avatarImageView.backgroundColor = .systemBackground
             avatarImageView.layer.cornerRadius = 55.0
             avatarImageView.layer.borderWidth = 3.0
             avatarImageView.layer.borderColor = UIColor.white.cgColor
             avatarImageView.image = avatar
             return avatarImageView
         }()

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
             setStatusButton.translatesAutoresizingMaskIntoConstraints = false
             setStatusButton.backgroundColor = .systemBlue
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
             statusLabel.text = statusText
             self.endEditing(true)
             print(statusText)
         }
    
    lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
            statusTextField.translatesAutoresizingMaskIntoConstraints = false
            statusTextField.indent(size: 10)
            statusTextField.text = "Enter text here ..."
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
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextField].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            // Отступ слева - 16pt от левой границы safeArea
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            // Отступ сверху - 16pt от верхней границы safeArea
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
            // Размер изображения по вертикали - 110pt
            avatarImageView.heightAnchor.constraint(equalToConstant: 110.0),
            // Размер изображения по горизонтали - 110pt
            avatarImageView.widthAnchor.constraint(equalToConstant: 110.0),
            // Отступ слева - 16pt от правой границы изображения
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),

            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            // Текст статуса / Нижняя граница - 34pt от верха button Set status
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -68.0),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
                     
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16.0),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            statusTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: -16.0),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
            // Высота кнопки от вехра 16pt
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32.0),
            // Ширина кнопки
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
            // Высота кнопки - 50pt
            setStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
                 ])
             }

         private func setupView(){
             addSubview(avatarImageView)
             addSubview(fullNameLabel)
             addSubview(statusLabel)
             addSubview(setStatusButton)
             addSubview(statusTextField)
             setupLayout()
         }

}

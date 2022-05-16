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
             setupView()
         }

         required init?(coder: NSCoder) {
             super.init(coder: coder)
         }

         lazy var profileAvatarImage: UIImageView = {
             let tempImage = UIImage(named: "pic")
             let profileAvatarImage = UIImageView()
             profileAvatarImage.translatesAutoresizingMaskIntoConstraints = false
             profileAvatarImage.clipsToBounds = true
             profileAvatarImage.backgroundColor = .systemBackground
             profileAvatarImage.layer.cornerRadius = 55.0
             profileAvatarImage.layer.borderWidth = 3.0
             profileAvatarImage.layer.borderColor = UIColor.white.cgColor
             profileAvatarImage.image = tempImage
             return profileAvatarImage
         }()

         lazy var profileNameLabel: UILabel = {
             let profileNameLabel = UILabel()
             profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
             profileNameLabel.text = "Venediktova Kate"
             profileNameLabel.textColor = .black
             profileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
             return profileNameLabel
         }()

         lazy var profileStatusTextField: UITextField = {
             let profileStatusTextField = UITextField()
             profileStatusTextField.translatesAutoresizingMaskIntoConstraints = false
             profileStatusTextField.text = "Waiting for something..."
             profileStatusTextField.textColor = .gray
             profileStatusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
             profileStatusTextField.isUserInteractionEnabled = false
             return profileStatusTextField
         }()

         lazy var showStatusButton: UIButton = {
             let showStatusButton = UIButton()
             showStatusButton.translatesAutoresizingMaskIntoConstraints = false
             showStatusButton.backgroundColor = .systemBlue
             showStatusButton.setTitle("Set status", for: .normal)
             showStatusButton.setTitleColor(UIColor.white, for: .normal)
             showStatusButton.layer.cornerRadius = 12.0
             showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
             showStatusButton.layer.shadowRadius = 4.0
             showStatusButton.layer.shadowColor = UIColor.black.cgColor
             showStatusButton.layer.shadowOpacity = 0.7
             showStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
             return showStatusButton
         }()

         @objc private func buttonPressed() {
             profileStatusTextField.text = statusText
//             newStatusTextField.text = "Enter text here ..."
             self.endEditing(true)
             print(statusText)
         }
    
    lazy var newStatusTextField: UITextField = {
             let newStatusTextField = UITextField()
             newStatusTextField.translatesAutoresizingMaskIntoConstraints = false
             newStatusTextField.indent(size: 10)
             newStatusTextField.text = "Enter text here ..."
             newStatusTextField.textColor = .black
             newStatusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
             newStatusTextField.backgroundColor = .white
             newStatusTextField.layer.borderWidth = 1.0
             newStatusTextField.layer.borderColor = UIColor.black.cgColor
             newStatusTextField.layer.cornerRadius = 12.0
             newStatusTextField.addTarget(self, action: #selector(statusTextChanges), for: .editingChanged)
             return newStatusTextField
         }()
    
    @objc private func statusTextChanges() {
            statusText = newStatusTextField.text!
            print(newStatusTextField)
        }
    
         private func setupLayout(){
             NSLayoutConstraint.activate([
                 // Отступ слева - 16pt от левой границы safeArea
                 profileAvatarImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
                 // Отступ сверху - 16pt от верхней границы safeArea
                 profileAvatarImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16.0),
                 // Размер изображения по вертикали - 110pt
                 profileAvatarImage.heightAnchor.constraint(equalToConstant: 110.0),
                 // Размер изображения по горизонтали - 110pt
                 profileAvatarImage.widthAnchor.constraint(equalToConstant: 110.0),

                 // Отступ слева - 16pt от правой границы изображения
                 profileNameLabel.leadingAnchor.constraint(equalTo: profileAvatarImage.trailingAnchor, constant: 16.0),
                 profileNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27.0),
                 profileNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),

                profileStatusTextField.leadingAnchor.constraint(equalTo: profileAvatarImage.trailingAnchor, constant: 16.0),
                 // Текст статуса / Нижняя граница - 34pt от верха button Set status
                profileStatusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -68.0),
                profileStatusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
                 
                 newStatusTextField.leadingAnchor.constraint(equalTo: profileAvatarImage.trailingAnchor, constant: 16.0),
                 newStatusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
                 newStatusTextField.topAnchor.constraint(equalTo: profileAvatarImage.bottomAnchor, constant: -16.0),
                 newStatusTextField.heightAnchor.constraint(equalToConstant: 40),

                 showStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
                 // Высота кнопки от вехра 16pt
                 showStatusButton.topAnchor.constraint(equalTo: profileAvatarImage.bottomAnchor, constant: 32.0),
                 // Ширина кнопки
                 showStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
                 // Высота кнопки - 50pt
                 showStatusButton.heightAnchor.constraint(equalToConstant: 50.0)
             ])
         }

         private func setupView(){
             addSubview(profileAvatarImage)
             addSubview(profileNameLabel)
             addSubview(profileStatusTextField)
             addSubview(showStatusButton)
             addSubview(newStatusTextField)
             setupLayout()
         }

}

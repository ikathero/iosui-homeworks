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
             let profileAvatarImage = UIImageView(frame: CGRect(x: 16, y: 16, width: 110, height: 110))
             //profileAvatarImage.translatesAutoresizingMaskIntoConstraints = false
             profileAvatarImage.clipsToBounds = true
             profileAvatarImage.backgroundColor = .systemBackground
             profileAvatarImage.layer.cornerRadius = 55.0
             profileAvatarImage.layer.borderWidth = 3.0
             profileAvatarImage.layer.borderColor = UIColor.white.cgColor
             profileAvatarImage.image = tempImage
             return profileAvatarImage
         }()

         lazy var profileNameLabel: UILabel = {
             let profileNameLabel = UILabel(frame: CGRect(x: 142, y: 27, width: 150, height: 20))
             //profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
             profileNameLabel.text = "Venediktova Kate"
             profileNameLabel.textColor = .black
             profileNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
             return profileNameLabel
         }()

         lazy var profileStatusTextField: UITextField = {
             let profileStatusTextField = UITextField(frame: CGRect(x: 142, y: 78, width: 200, height: 16))
             //profileStatusTextField.translatesAutoresizingMaskIntoConstraints = false
             profileStatusTextField.text = "Waiting for something..."
             profileStatusTextField.textColor = .gray
             profileStatusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
             profileStatusTextField.isUserInteractionEnabled = false
             return profileStatusTextField
         }()

         lazy var showStatusButton: UIButton = {
             let showStatusButton = UIButton(frame: CGRect(x: 16, y: 150, width: UIScreen.main.bounds.width - 32, height: 50))
             //showStatusButton.translatesAutoresizingMaskIntoConstraints = false
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
             self.endEditing(true)
             print(statusText)
         }
    
    lazy var newStatusTextField: UITextField = {
             let newStatusTextField = UITextField(frame: CGRect(x: 142, y: 100, width: UIScreen.main.bounds.width - 158, height: 40))
             //newStatusTextField.translatesAutoresizingMaskIntoConstraints = false
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

         private func setupView(){
             addSubview(profileAvatarImage)
             addSubview(profileNameLabel)
             addSubview(profileStatusTextField)
             addSubview(showStatusButton)
             addSubview(newStatusTextField)
         }

}

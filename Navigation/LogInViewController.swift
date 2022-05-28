//
//  LogInViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 21.05.2022.
//
extension String {
    func isValidPassword(_ regEx: String) -> Bool {
        return self.range(of: regEx, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

import UIKit

class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())
    
    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }

    private let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "logo.jpg")
        logoImage.clipsToBounds = true
        return logoImage
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.backgroundColor = .lightGray
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()

    private lazy var userLoginTextField: UITextField = {
        let userLoginTextField = UITextField()
        userLoginTextField.translatesAutoresizingMaskIntoConstraints = false
        userLoginTextField.indent(size: 10)
        userLoginTextField.placeholder = "Email or phone"
        userLoginTextField.textColor = .black
        userLoginTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userLoginTextField.autocapitalizationType = .none
        userLoginTextField.backgroundColor = .systemGray6
        userLoginTextField.delegate = self
        return userLoginTextField
    }()

    private let minLenght = 8
    private lazy var passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{\(minLenght),14}$"
    
    private let password = "Diploma22!" // пароль для входа
    private let email = "ikathero@gmail.com" // почта для входа
    
    private lazy var userPasswordTextField: UITextField = {
        let userPasswordTextField = UITextField()
        userPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        userPasswordTextField.indent(size: 10)
        userPasswordTextField.placeholder = "Password"
        userPasswordTextField.isSecureTextEntry = true
        userPasswordTextField.textColor = .black
        userPasswordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userPasswordTextField.backgroundColor = .systemGray6
        userPasswordTextField.delegate = self
        return userPasswordTextField
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
        
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        let colorButton = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.backgroundColor = colorButton
        logInButton.layer.cornerRadius = 10
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.backgroundColor?.withAlphaComponent(1)
        
        if logInButton.isSelected || logInButton.isHighlighted || logInButton.isEnabled == false {
            logInButton.backgroundColor?.withAlphaComponent(0.8)
            }
        logInButton.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        return logInButton
    }()
    
    lazy var logIn = false
    
    @objc private func logInButtonAction() {
        let profileVC = ProfileViewController()
            if logIn == true {
        self.navigationController?.pushViewController(profileVC, animated: false)
        } else { UIView.animate(
            withDuration: 1.0,
                delay: 0,
                usingSpringWithDamping: 0.1,
                initialSpringVelocity: 0.1,
                options: .curveEaseInOut) {
                    self.stackView.layer.borderColor = UIColor.systemRed.cgColor
                }
        }
    }
    
    // MARK: UIScrollView keyboard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil) // - клавиатура показана на экране
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil) // - клавиатура спрятана
    }
    
    // отписываемся от viewWillAppear
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
      
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func setupLayout() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            /// Обязательно выставить ширину contentView !!!
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        [logoImage, stackView, logInButton, messageLabel].forEach { contentView.addSubview($0) }
        [userLoginTextField, userPasswordTextField].forEach { stackView.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            
            // LogoImage
            logoImage.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            
            // StackView
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            // MessageLabel
            messageLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 2),
            messageLabel.centerXAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerXAnchor),
            
            // LogInText
            userLoginTextField.heightAnchor.constraint(equalToConstant: 50),
            // PasswordText
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
                 
            // LogInButton
            logInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
                 /// Обязательно закрепить нижний элемент к низу contentView !!!
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    private func incorrectFill(){
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.systemRed.cgColor
        messageLabel.textColor = .systemRed
    }
    private func checkValidation(passwordCheck: String) {
        if userPasswordTextField.isEditing {
            guard passwordCheck.count >= minLenght else { // если меньше 8 символов то
                messageLabel.textColor = .systemRed
                messageLabel.text = "Password must be longer than \(minLenght - passwordCheck.count) characters"
            return
            }
            if passwordCheck.isValidPassword(passwordRegEx) { // совпадает
                messageLabel.textColor = .systemGreen
                messageLabel.text = ""
            } else {
                messageLabel.textColor = .systemRed // не совпадает
                messageLabel.text = ""
            }
        }
    }

}
// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        if  userLoginTextField.text == "" {
            incorrectFill()
            messageLabel.text = "Email/phone can't be empty"
        } else if userPasswordTextField.text == "" {
            incorrectFill()
            messageLabel.text = "Password can't be empty"
        } else if userPasswordTextField.text == password && userLoginTextField.text == email {
            stackView.layer.borderColor = UIColor.systemGreen.cgColor
            messageLabel.textColor = .systemGreen
            logIn = true
                
        } else if userPasswordTextField.text != password || userLoginTextField.text != email {
            incorrectFill()
            
            let alert = UIAlertController(title: "Error", message: "Incorrect email, phone or password", preferredStyle: .alert)
            let tryAction = UIAlertAction(title: "Try again", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(tryAction)
            present(alert, animated: true)
            
        }
        
        userPasswordTextField.resignFirstResponder()
        userLoginTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") + string
        let res: String

        if range.length == 1 {
            let end = text.index(text.startIndex, offsetBy: text.count - 1)
            res = String(text[text.startIndex..<end])
        } else {
            res = text
        }
        checkValidation(passwordCheck: res)
        textField.text = res
        return false
    }
}

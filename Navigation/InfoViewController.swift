//
//  InfoViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 10.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        makeButton()
    }
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.center = view.center
        button.setTitle("Tap to try something ...", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        view.addSubview(button)
    }
    
    @objc private func tapAction() {
        let alert = UIAlertController(title: "BooM !!!", message: "Do you wanna to go back?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Back", style: .default) { _ in
            self.dismiss(animated: true)
            print("The user pressed - Back")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("The user pressed - Cancel")
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
            
        present(alert, animated: true)
    }
}

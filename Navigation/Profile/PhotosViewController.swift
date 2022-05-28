//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Venediktova Kate on 22.05.2022.
//

import UIKit

let photos: [Photos] = Photos.makeMockModel()

class PhotosViewController: UIViewController {
    
    private lazy var imagePosition = photoImageView.layer.position
    private lazy var imageBounds = photoImageView.layer.bounds
    
    private lazy var blackoutView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isUserInteractionEnabled = false
        view.alpha = 0.0
        return view
    }()
    
    private var photoImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 0
        view.clipsToBounds = true
        view.isUserInteractionEnabled = true
        view.alpha = 0.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        self.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        setupLayout()
    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 8
        $0.minimumInteritemSpacing = 8
        return $0
    }(UICollectionViewFlowLayout())
    
    private lazy var collectionView: UICollectionView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.dataSource = self
        $0.delegate = self
        $0.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: self.layout))
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc private func tapImageAction() {
        UIImageView.animate(withDuration: 0.5,
                            animations: {
            self.blackoutView.alpha = 0.8
            self.photoImageView.alpha = 1
            self.photoImageView.layer.cornerRadius = 0
            self.photoImageView.layer.borderWidth = 0
            self.photoImageView.contentMode = .scaleAspectFill
            self.photoImageView.clipsToBounds = false
            self.collectionView.isScrollEnabled = false
            self.collectionView.isUserInteractionEnabled = false
        }, completion: { _ in
            UIImageView.animate(withDuration: 0.3) { [self] in
                let rightBarItem = UIBarButtonItem(image: UIImage(systemName: "multiply.circle"), style: .plain, target: self, action: #selector(self.closeImageAction))
                navigationItem.rightBarButtonItem = rightBarItem
                self.layout.collectionView?.layoutIfNeeded()
            }
        })
    }
    
    @objc private func closeImageAction() {
            UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: 1.0,
                           initialSpringVelocity: 0.0,
                           options: .curveEaseInOut) {
                self.navigationItem.rightBarButtonItem = .none
            } completion: { _ in
                UIView.animate(withDuration: 0.5,
                               delay: 0.0) {
                    self.blackoutView.alpha = 0
                    self.photoImageView.alpha = 0
                    self.photoImageView.isUserInteractionEnabled = true
                    self.collectionView.isScrollEnabled = true
                    self.collectionView.isUserInteractionEnabled = true
                    self.layout.collectionView?.layoutIfNeeded()
                }
            }
    }
    
    private func setupLayout() {
   
        [collectionView, blackoutView, photoImageView].forEach {view.addSubview($0) }

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Photo Image
            photoImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            photoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            photoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor),
            
            // BlackoutView
            blackoutView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            blackoutView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            blackoutView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            blackoutView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    // Отображение конкретной ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photos[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (collectionView.bounds.width - sideInset * 4) / 3 // количество отступов (4) и ячеек (3) в строке
            return CGSize(width: width, height: width)
    }
    
    // Расстояние между ячейками, использовать все: minimumLineSpacingForSectionAt, insetForSectionAt, minimumInteritemSpacingForSectionAt, minimumInteritemSpacingForSectionAt
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
             sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
             UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
             sideInset
    }

    func collectionView(_ collectionView: UICollectionView, minimumInteritemSpacingForSectionAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photoImageView.image = UIImage(named: photos[indexPath.row].image)
        tapImageAction()
    }
}

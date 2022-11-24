//
//  ProfileCollectionViewCell.swift
//  Vercha
//
//  Created by Vlad on 24/11/22.
//

import Foundation
import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
 static let identifier = "profileCollectionViewCell"

    let buttonView = UIButton()
    let profileView = UIView()

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupProfileView()
        setupButtonView()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        
    }

    func setupProfileView() {
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            profileView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 100),
            profileView.widthAnchor.constraint(equalToConstant: 100)
        ])
        profileView.backgroundColor = .clear

    }

    func setupButtonView() {
        profileView.addSubview(buttonView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10),
            buttonView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 10),
            buttonView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -10),
            buttonView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -10),
            buttonView.heightAnchor.constraint(equalToConstant: 90),
            buttonView.widthAnchor.constraint(equalToConstant: 90)
        ])
        buttonView.backgroundColor = .white
        buttonView.layer.cornerRadius = 40
        buttonView.setImage(UIImage(systemName: "person"), for: .normal)
        buttonView.layer.shadowColor = UIColor.gray.cgColor
        buttonView.layer.shadowOpacity = 0.9
        buttonView.layer.shadowOffset = .zero
        buttonView.layer.shadowRadius = 2
    }
}



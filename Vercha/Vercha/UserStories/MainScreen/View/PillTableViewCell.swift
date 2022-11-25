//
//  PillTableViewCell.swift
//  Vercha
//
//  Created by Vlad on 24/11/22.
//

import Foundation
import UIKit

class PillTableViewCell: UITableViewCell {
    static let identifier = "pillsTableViewCell"
    // MARK: - Private Properties
    private let mainView = UIView()
    private let pillCellView = UIView()
    private let pillImage = UIImageView()
    private let nameLabel = UILabel()
    private var infoLabel = UILabel()
    private let tagView = UIView()
    private let doneButton = UIButton()


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupMainView()
        setupPillCellView()
        setupPillImage()
        setupNameLabel()
        setupInfo()
        setupDoneButton()
    }

    func configure(pill: Pill?) {
        guard let pill = pill else { return }
        pillImage.image = pill.image
        nameLabel.text = pill.name
        infoLabel.text = buildPillInfo(pill: pill)
        doneButton.isHidden = !pill.status
    }

    private func buildPillInfo(pill: Pill) -> String {
        return "\(pill.time) - \(pill.pillCount) - \(pill.eatingTime)"
    }

    private func setupMainView() {
        addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 100)
        ])
        mainView.contentMode = .scaleAspectFill
        mainView.backgroundColor = .clear
        mainView.clipsToBounds = true
        mainView.layer.shadowColor = UIColor.gray.cgColor
        mainView.layer.shadowOpacity = 0.9
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowOffset = CGSize(width: 0 , height: 1)
    }

    private func setupPillCellView() {
        mainView.addSubview(pillCellView)
        pillCellView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pillCellView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 5),
            pillCellView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            pillCellView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            pillCellView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            pillCellView.heightAnchor.constraint(equalToConstant: 100)
        ])
        pillCellView.layer.cornerRadius = 20
        pillCellView.contentMode = .scaleAspectFill
        pillCellView.backgroundColor = .white
        pillCellView.clipsToBounds = true
    }

    private func setupPillImage() {
        pillCellView.addSubview(pillImage)
        pillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pillImage.topAnchor.constraint(equalTo: pillCellView.topAnchor, constant: 15),
            pillImage.leftAnchor.constraint(equalTo: pillCellView.leftAnchor, constant: 10),
            pillImage.heightAnchor.constraint(equalToConstant: 30),
            pillImage.widthAnchor.constraint(equalToConstant: 30)
        ])
        pillImage.layer.borderWidth = 0.5
        pillImage.layer.borderColor = UIColor.lightGray.cgColor
        pillImage.layer.cornerRadius = 5
        pillImage.tintColor = .lightGray
    }

    private func setupNameLabel() {
        pillCellView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: pillCellView.topAnchor, constant: 25),
            nameLabel.leftAnchor.constraint(equalTo: pillImage.leftAnchor, constant: 40),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.numberOfLines = 1
    }

    private func setupInfo() {
        pillCellView.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: pillImage.topAnchor, constant: 35),
            infoLabel.leftAnchor.constraint(equalTo: pillCellView.leftAnchor, constant: 10),
            infoLabel.heightAnchor.constraint(equalToConstant: 20),
            infoLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        infoLabel.textColor = .lightGray
        infoLabel.font = UIFont(name: "HelveticaNeue", size: 15)
    }

    private func setupDoneButton() {
        pillCellView.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: pillCellView.topAnchor, constant: 10),
            doneButton.leftAnchor.constraint(equalTo: pillCellView.rightAnchor, constant: -80),
            doneButton.heightAnchor.constraint(equalToConstant: 65),
            doneButton.widthAnchor.constraint(equalToConstant: 65)
        ])
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .bold, scale: .large)
        doneButton.backgroundColor = CustomColor.velvetLight
        doneButton.setImage(UIImage(systemName: "checkmark", withConfiguration: largeConfig), for: .normal)
        doneButton.imageView?.tintColor = .white
        doneButton.layer.cornerRadius = 65/2
        doneButton.alpha = 0.3
    }
}

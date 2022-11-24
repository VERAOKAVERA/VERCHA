//
//  MainViewController.swift
//  Vercha
//
//  Created by Vlad on 24/11/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    let tableView = UITableView()
    let addView = UIView()
    let addButton = UIButton()
    let collectionLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        return layout
    }()

    lazy var profilesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)


    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupTableView()
        setupAddButtonView()
        setupAddButton()
        setupCalendar()
    }

    func setupCalendar() {

    }

    private func setupCollectionView(){
        view.addSubview(profilesCollectionView)
        profilesCollectionView.delegate = self
        profilesCollectionView.dataSource = self
        profilesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profilesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profilesCollectionView.heightAnchor.constraint(equalToConstant: 100),
            profilesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        profilesCollectionView.backgroundColor = .clear
        profilesCollectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profilesCollectionView.showsHorizontalScrollIndicator = false
    }
    private func setupAddButtonView() {
        view.addSubview(addView)
        addView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            addView.heightAnchor.constraint(equalToConstant: 90),
            addView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        addView.backgroundColor = .clear
    }

    private func setupAddButton() {
        addView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 10),
            addButton.heightAnchor.constraint(equalTo: addView.heightAnchor, constant: -41),
            addButton.rightAnchor.constraint(equalTo: addView.rightAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: addView.bottomAnchor, constant: -30)
        ])
        let sfConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .heavy)
        addButton.backgroundColor = .green
        addButton.setImage(UIImage(systemName: "plus", withConfiguration: sfConfig), for: .normal)
        addButton.imageView?.tintColor = .white
        addButton.layer.cornerRadius = 18
        addButton.layer.shadowColor = UIColor.gray.cgColor
        addButton.layer.shadowOpacity = 0.9
        addButton.layer.shadowRadius = 2
        addButton.layer.shadowOffset = CGSize(width: 0 , height:1)
    }

    private func setupTableView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PillTableViewCell.self, forCellReuseIdentifier: PillTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: profilesCollectionView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pillsTableViewCell",
                                                       for: indexPath) as? PillTableViewCell else {return UITableViewCell()}
        cell.configure(pill: Pill(name: "", image: UIImage(named: "pill") ?? UIImage(), time: "", pillCount: "", eatingTime: "", status: true), indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
}

extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        cell.configure()
        return cell
    }
}

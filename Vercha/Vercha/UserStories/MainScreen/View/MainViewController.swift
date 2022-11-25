//
//  MainViewController.swift
//  Vercha
//
//  Created by Vlad on 24/11/22.
//

import Foundation
import UIKit

final class MainViewController: UIViewController {

    var presenter: MainViewPresenterProtocol?

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
        self.navigationController?.isNavigationBarHidden = true
        setupCollectionView()
        setupTableView()
        setupAddButtonView()
        setupAddButton()
        setupCalendar()
        presenter?.setupProfileCollection()
        presenter?.setupPills()

    }

    func setupCalendar() {}
    /// Создание коллекции с профилями
    private func setupCollectionView(){
        view.addSubview(profilesCollectionView)
        profilesCollectionView.delegate = self
        profilesCollectionView.dataSource = self
        profilesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profilesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profilesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profilesCollectionView.heightAnchor.constraint(equalToConstant: 140),
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
        addButton.backgroundColor = CustomColor.velvetDark
        addButton.setImage(UIImage(systemName: "plus", withConfiguration: sfConfig), for: .normal)
        addButton.imageView?.tintColor = .white
        addButton.layer.cornerRadius = 18
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
            tableView.topAnchor.constraint(equalTo: profilesCollectionView.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pillsCount = presenter?.pills.count else { return 0}
        return pillsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pillsTableViewCell",
                                                       for: indexPath) as? PillTableViewCell else {return UITableViewCell()}
        cell.configure(pill: presenter?.pills[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let profilesCount = presenter?.profiles.count else { return 0 }
        return profilesCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(profile: (presenter?.profiles[indexPath.row])!)
        return cell
    }
}
extension MainViewController: MainViewProtocol {
    func reloadTable() {
        tableView.reloadData()
    }
}

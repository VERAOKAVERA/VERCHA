//
//  MainPresenter.swift
//  Vercha
//
//  Created by Vlad on 24/11/22.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    func reloadTable()
}

// MARK: - MainViewPresenterProtocol
protocol MainViewPresenterProtocol: AnyObject {
    var pills: [Pill] { get }
    func setupPills()
}

// MARK: - MainPresentor
class MainPresenter: MainViewPresenterProtocol {
    var pills = [Pill(name: "Ugol", image: UIImage(systemName: "pill.fill")!, time: "11:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                Pill(name: "Monona", image: UIImage(systemName: "pill")!, time: "9:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                Pill(name: "Monona", image: UIImage(systemName: "pill.fill")!, time: "12:00PM", pillCount: "9 pills", eatingTime: "Before eating", status: true),
                Pill(name: "Cororona", image: UIImage(systemName: "pill")!, time: "6:00PM", pillCount: "3 pills", eatingTime: "Before eating", status: true),
                Pill(name: "Asperagus Monicus", image: UIImage(systemName: "pill.fill")!, time: "10:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                Pill(name: "Lovatina", image: UIImage(systemName: "pill")!, time: "11:00AM", pillCount: "1 pills", eatingTime: "Before eating", status: true)
       ]
    private weak var view: MainViewProtocol?
    var router: RouterProtocol

    init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }

    // FIXME: - убрать форс анврапы
    func setupPills() {
        pills = [Pill(name: "Ugol", image: UIImage(systemName: "pill.fill")!, time: "11:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                 Pill(name: "Monona", image: UIImage(systemName: "pill")!, time: "9:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                 Pill(name: "Monona", image: UIImage(systemName: "pill.fill")!, time: "12:00PM", pillCount: "9 pills", eatingTime: "Before eating", status: true),
                 Pill(name: "Cororona", image: UIImage(systemName: "pill")!, time: "6:00PM", pillCount: "3 pills", eatingTime: "Before eating", status: true),
                 Pill(name: "Asperagus Monicus", image: UIImage(systemName: "pill.fill")!, time: "10:00AM", pillCount: "2 pills", eatingTime: "Before eating", status: true),
                 Pill(name: "Lovatina", image: UIImage(systemName: "pill")!, time: "11:00AM", pillCount: "1 pills", eatingTime: "Before eating", status: true)
        ]

        view?.reloadTable()
    }
}

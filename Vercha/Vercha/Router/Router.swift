//
//  Router.swift
//  Vercha
//
//  Created by Vlad on 25/11/22.
//

import Foundation
import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
}

class Router: RouterProtocol {
    // MARK: - Internal Properties
    var assemblyBuilder: AssemblyProtocol?
    var navigationController: UINavigationController?

    init(assemblyBuilder: AssemblyProtocol, navigationController: UINavigationController) {
        self.assemblyBuilder = assemblyBuilder
        self.navigationController = navigationController

    }

    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let mainViewController = assemblyBuilder?.buildMain(router: self) else { return }
        navigationController.viewControllers = [mainViewController]
    }
}

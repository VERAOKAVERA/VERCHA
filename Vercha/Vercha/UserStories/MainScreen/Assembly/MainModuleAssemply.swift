//
//  MainModuleAssemply.swift
//  Vercha
//
//  Created by Vlad on 25/11/22.
//

import Foundation
import UIKit

protocol AssemblyProtocol: AnyObject {
    func buildMain(router: RouterProtocol) -> UIViewController
}

final class MainAssembly: AssemblyProtocol {
    func buildMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
}

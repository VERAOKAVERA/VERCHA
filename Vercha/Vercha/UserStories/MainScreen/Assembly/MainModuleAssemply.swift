import UIKit

protocol AssemblyProtocol: AnyObject {
    func buildMain(router: RouterProtocol) -> UIViewController
}

final class MainAssembly: AssemblyProtocol {
    func buildMain(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view,
                                      router: router)
        view.presenter = presenter
        return view
    }
}

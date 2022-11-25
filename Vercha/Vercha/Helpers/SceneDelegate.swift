import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let assemblyBuilder = MainAssembly()
        let navigationVC = UINavigationController()
        let router = Router(assemblyBuilder: assemblyBuilder,
                            navigationController: navigationVC)
        router.initialViewController()
        window.rootViewController = navigationVC
        self.window = window
        window.makeKeyAndVisible()
    }
}


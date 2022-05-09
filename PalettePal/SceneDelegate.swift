import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        let randomPaletteViewController = RandomPaletteViewController()
        randomPaletteViewController.tabBarItem = UITabBarItem(title: "explore", image: UIImage(systemName: "lightbulb"), tag: 0)
        
        let paletteCollectionViewController = PaletteCollectionViewController()
        paletteCollectionViewController.tabBarItem = UITabBarItem(title: "palettes", image: UIImage(systemName: "heart"), tag: 1)
        
        tabBarController.viewControllers = [
            randomPaletteViewController,
            paletteCollectionViewController
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        let navigationController = UINavigationController(rootViewController: tabBarController)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}


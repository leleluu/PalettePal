import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        
        let randomPaletteViewController = RandomPaletteViewController()
        let randomPaletteNavigationController = UINavigationController(rootViewController: randomPaletteViewController)
        
        randomPaletteNavigationController.tabBarItem = UITabBarItem(title: "explore", image: UIImage(systemName: "lightbulb"), tag: 0)
        
        
        let paletteCollectionViewController = PaletteCollectionViewController()
        let paletteCollectionNavigationController = UINavigationController(rootViewController: paletteCollectionViewController)
        
        paletteCollectionNavigationController.tabBarItem = UITabBarItem(title: "palettes", image: UIImage(systemName: "heart"), tag: 1)
        
        tabBarController.viewControllers = [
            randomPaletteNavigationController,
            paletteCollectionNavigationController
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        window?.rootViewController = tabBarController
        
        window?.makeKeyAndVisible()
    }
}


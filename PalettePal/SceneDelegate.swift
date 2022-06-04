import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        
        // Random Palette
        
        let randomPaletteViewController = RandomPaletteViewController()
        let randomPaletteNavigationController = UINavigationController(rootViewController: randomPaletteViewController)
        
        randomPaletteNavigationController.tabBarItem = UITabBarItem(title: "Generator", image: UIImage(systemName: "dice"), tag: 0)
        
        // My Palettes
        
        let paletteCollectionViewController = PaletteCollectionViewController()
        let paletteCollectionNavigationController = UINavigationController(rootViewController: paletteCollectionViewController)
        
        paletteCollectionNavigationController.tabBarItem = UITabBarItem(title: "My Palettes", image: UIImage(systemName: "bookmark"), tag: 1)
        
        let inspirationViewController = InspirationViewController()
        let inspirationNavigationController = UINavigationController(rootViewController: inspirationViewController)
        
        inspirationNavigationController.tabBarItem = UITabBarItem(title: "Inspiration", image: UIImage(systemName: "lightbulb"), tag: 2)
        
        tabBarController.viewControllers = [
            randomPaletteNavigationController,
            paletteCollectionNavigationController,
            inspirationNavigationController
        ]
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        
        UINavigationBar.appearance().tintColor = .systemOrange
        UITabBar.appearance().tintColor = .systemOrange
            
        window?.rootViewController = tabBarController
        
        window?.makeKeyAndVisible()
    }
}


import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = .background.withAlphaComponent(0.7)
    }
    
    private func setupTabBar() {
        viewControllers = [
            setupVC(viewController: FirstViewControllerWrapper(), title: "Users", image: UIImage(systemName: "1.circle")),
            setupVC(viewController: SecondViewController(), title: "Второй", image: UIImage(systemName: "2.circle")),
            setupVC(viewController: ThirdViewController(), title: "Третий", image: UIImage(systemName: "3.circle"))
        ]
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
}


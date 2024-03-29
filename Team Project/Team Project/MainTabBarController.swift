import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.isTranslucent = true
        self.tabBar.barTintColor = .backgroudTableView.withAlphaComponent(0.7)
    }
    
    private func setupTabBar() {
        viewControllers = [
            setupVC(viewController: FirstViewControllerWrapper(), title: "Users", image: UIImage(systemName: "person.fill")),
            setupVC(viewController: UINavigationController(rootViewController: SecondViewController()), title: "Crypto", image: UIImage(systemName: "dollarsign.circle")),
            setupVC(viewController: ThirdViewControllerWrapper(), title: "Top10", image: UIImage(systemName: "10.circle"))
        ]
    }
    
    private func setupVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
}


import UIKit
import SwiftUI

//MARK: - SUI WRAPPER
class FirstViewControllerWrapper: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstViewController = UIHostingController(rootView: FirstViewController())
        addChild(firstViewController)
        view.addSubview(firstViewController.view)
        firstViewController.view.frame = view.bounds
        firstViewController.didMove(toParent: self)
    }
}

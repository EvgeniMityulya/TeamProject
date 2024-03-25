import SwiftUI
import UIKit

final class ThirdViewControllerWrapper: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thirdViewController = UIHostingController(rootView: ThirdView())
        addChild(thirdViewController)
        view.addSubview(thirdViewController.view)
        thirdViewController.view.frame = view.bounds
        thirdViewController.didMove(toParent: self)
    }
}

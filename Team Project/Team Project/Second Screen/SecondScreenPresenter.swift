import UIKit

final class SecondScreenPresenter {
    
    private unowned let view: SecondViewController
    
    init(view: SecondViewController) {
        self.view = view
    }
    
    func requestJSON() {
        view.activityIndicator.startAnimating()
        NetworkManager.instance.getAssets { result in
            switch result {
            case .success(let coin):
                DispatchQueue.main.async {
                    self.view.arrayCoin = coin
                    self.view.tableView.reloadData()
                    print("success")
                }
                self.view.activityIndicator.stopAnimating()
                self.view.activityIndicator.removeFromSuperview()
            case .failure:
                DispatchQueue.main.async {
                    print("failure")
                }
                self.view.activityIndicator.stopAnimating()
                self.view.activityIndicator.removeFromSuperview()
            }
        }
    }
}

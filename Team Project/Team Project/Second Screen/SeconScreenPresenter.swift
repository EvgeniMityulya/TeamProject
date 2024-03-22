import UIKit

protocol SecondScreenPresenterProtocol: AnyObject {
    func requestJSON()
}

final class SecondScreenPresenter: SecondScreenPresenterProtocol {
    
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
                    self.view.coin = coin
                    self.view.tableView.reloadData()
                }
                self.view.activityIndicator.stopAnimating()
                self.view.activityIndicator.removeFromSuperview()
            case .failure:
                DispatchQueue.main.async {

                }
                self.view.activityIndicator.stopAnimating()
                self.view.activityIndicator.removeFromSuperview()
            }
        }
    }
}

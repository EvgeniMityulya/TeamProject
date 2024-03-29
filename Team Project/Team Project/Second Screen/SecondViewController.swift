import UIKit

final class SecondViewController: UIViewController {
    // MARK: - PROPERTIES:
    
    let tableView = UITableView()
    var presenter: SecondScreenPresenter?
    var arrayCoin: [ModelCoin] = []
    let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableView()
        presenter = SecondScreenPresenter(view: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        title = "Crypto"
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.colorText]
        presenter?.requestJSON()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(tableView, activityIndicator)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
        // MARK: TABLE VIEW:
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        view.backgroundColor = .backgroudTableView
        tableView.backgroundColor = .backgroudTableView
        activityIndicator.center = view.center
    }
    
    // MARK: - CONFIGURE TABLE VIEW:
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CriptoTableViewCell.self, forCellReuseIdentifier: "CriptoTableViewCell")
        tableView.separatorStyle = .none
    }
}

// MARK: - EXTENSION:

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayCoin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CriptoTableViewCell", for: indexPath) as? CriptoTableViewCell else { return UITableViewCell() }
        let tmpCoin = arrayCoin[indexPath.row]
        cell.configure(tmpCoin)
        return cell
    }
}

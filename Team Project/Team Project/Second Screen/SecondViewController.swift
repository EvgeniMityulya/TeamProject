import UIKit

final class SecondViewController: UIViewController {
    // MARK: - PROPERTIES:
    
    private let titleLabel = UILabel()
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
        presenter?.requestJSON()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(titleLabel, tableView, activityIndicator)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        
        // MARK: TITLE LABEL:
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        
        // MARK: TABLE VIEW:

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        view.backgroundColor = .backgroudTableView
        tableView.backgroundColor = .backgroudTableView
        activityIndicator.center = view.center
        
        // MARK: TITLE LABEL:
        
        titleLabel.text = "Crypto"
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.textColor = .colorText
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

import UIKit

final class SecondViewController: UIViewController {
    // MARK: - PROPERTIES:
    
    private let segmentControl = UISegmentedControl()
    private let catsTableView = UITableView()
    private let dogsTableView = UITableView()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        configureTableView()
        configureSegmentControl()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(segmentControl, catsTableView, dogsTableView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // MARK: SEGMENT CONTROL:
        
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        segmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentControl.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        // MARK: CATS TABLE VIEW:

        catsTableView.translatesAutoresizingMaskIntoConstraints = false
        catsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        catsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        catsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        catsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // MARK: DOGS TABLE VIEW:

        dogsTableView.translatesAutoresizingMaskIntoConstraints = false
        dogsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        dogsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dogsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dogsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // MARK: NAVIGATION CONTROLLER:

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .backgroudTableView
        
        // MARK: TITLE:
        
        title = "Choose your animal"
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.brown,
            .font: UIFont.boldSystemFont(ofSize: 34)
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = titleAttributes
            
        // MARK: VIEW:

        view.backgroundColor = .backgroudTableView
        
        // MARK: CATS TABLE VIEW:

        catsTableView.backgroundColor = .backgroudTableView
        
        // MARK: DOGS TABLE VIEW:

        dogsTableView.backgroundColor = .backgroudTableView
    }
    
    // MARK: - CONFIGURE TABLE VIEW:
    
    private func configureTableView() {
        catsTableView.delegate = self
        catsTableView.dataSource = self
        catsTableView.register(CatsTableViewCell.self, forCellReuseIdentifier: "CatsTableViewCell")
        catsTableView.separatorStyle = .none
        
        dogsTableView.delegate = self
        dogsTableView.dataSource = self
        dogsTableView.register(DogsTableViewCell.self, forCellReuseIdentifier: "DogsTableViewCell")
        dogsTableView.separatorStyle = .none
        
        catsTableView.isHidden = false
        dogsTableView.isHidden = true
    }
    
    // MARK: - CONFIGURE SEGMENT CONTROL:
    
    private func configureSegmentControl() {
        segmentControl.insertSegment(withTitle: "Cats", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Dogs", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.backgroundColor = .clear
        segmentControl.tintColor = .clear
        segmentControl.selectedSegmentTintColor = .brown
        segmentControl.addTarget(self, action: #selector(segmentValueChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - HELPERS:
    
    // MARK: SEGMENT CONTROL ACTION:
        
    @objc private func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            catsTableView.isHidden = false
            dogsTableView.isHidden = true
            break
        case 1:
            catsTableView.isHidden = true
            dogsTableView.isHidden = false
            break
        default:
            break
        }
    }
}

// MARK: - EXTENSION:

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == catsTableView {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CatsTableViewCell", for: indexPath) as? CatsTableViewCell else { return UITableViewCell() }
                return cell
            } else if tableView == dogsTableView {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "DogsTableViewCell", for: indexPath) as? DogsTableViewCell else { return UITableViewCell() }
                return cell
            } else {
                return UITableViewCell()
            }
        }
}

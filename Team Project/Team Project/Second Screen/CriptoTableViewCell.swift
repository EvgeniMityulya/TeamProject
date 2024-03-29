
import UIKit

final class CriptoTableViewCell: UITableViewCell {
    // MARK: - PRIVATE PROPRTIES:

    private let containerView = UIView()
    private let nameCoinLabel = UILabel()
    private let valueCoinLabel = UILabel()
    
    // MARK: - LIFECYCLE:

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(nameCoinLabel)
        contentView.addSubview(valueCoinLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // MARK: CONTAINER VIEW:

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // MARK: NAME COIN:

        nameCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        nameCoinLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameCoinLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        nameCoinLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        nameCoinLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        
        // MARK: VALUE COIN:

        valueCoinLabel.translatesAutoresizingMaskIntoConstraints = false
        valueCoinLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        valueCoinLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        valueCoinLabel.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        valueCoinLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        selectionStyle = .none
        
        // MARK: CONTENT VIEW:

        contentView.backgroundColor = .backgroudTableView
        
        // MARK: CONTAINER VIEW:

        containerView.backgroundColor = .backgroudCell
        containerView.layer.cornerRadius = 10

        // MARK: NAME COIN:

        nameCoinLabel.textColor = .colorText
        
        // MARK: VALUE COIN:

        valueCoinLabel.textColor = .colorName
        valueCoinLabel.textAlignment = .right
    }
    
    // MARK: CONFIGURE:
    
    func configure(_ coin: ModelCoin) {
        nameCoinLabel.text = coin.name
        if let price = coin.priceUsd {
            let formattedPrice = String(format: "%.3f", price)
            valueCoinLabel.text = "\(formattedPrice) $"
        } else {
            valueCoinLabel.text = "Failed to load"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

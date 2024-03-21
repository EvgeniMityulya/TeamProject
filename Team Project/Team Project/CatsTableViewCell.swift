import UIKit

final class CatsTableViewCell: UITableViewCell {
    // MARK: - PRIVATE PROPERTIES:
    
    private let containerView = UIView()
    private let modelImageView = UIImageView()
    private let nameLabel = UILabel()
    private let verticalStackView = UIStackView()
    private let horizontalOneStackView = UIStackView()
    private let horizontalTwoStackView = UIStackView()
    private let horizontalThreeStackView = UIStackView()
    private let labelOne = UILabel()
    private let labelTwo = UILabel()
    private let labelThree = UILabel()
    private let labelFour = UILabel()
    private let labelFive = UILabel()
    private let labelSix = UILabel()
    
    // MARK: - LIFECYCLE:
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(modelImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalOneStackView)
        verticalStackView.addArrangedSubview(horizontalTwoStackView)
        verticalStackView.addArrangedSubview(horizontalThreeStackView)
        horizontalOneStackView.addArrangedSubview(labelOne)
        horizontalOneStackView.addArrangedSubview(labelTwo)
        horizontalTwoStackView.addArrangedSubview(labelThree)
        horizontalTwoStackView.addArrangedSubview(labelFour)
        horizontalThreeStackView.addArrangedSubview(labelFive)
        horizontalThreeStackView.addArrangedSubview(labelSix)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25).isActive = true
        
        modelImageView.translatesAutoresizingMaskIntoConstraints = false
        modelImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        modelImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        modelImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        modelImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.45).isActive = true
        modelImageView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: modelImageView.trailingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: modelImageView.trailingAnchor, constant: 40).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {

        contentView.backgroundColor = .backgroudTableView
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 25
        
        modelImageView.backgroundColor = .darkGray
        modelImageView.layer.cornerRadius = 25
        
        nameLabel.text = "Name cats"
        nameLabel.textColor = .colorName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.textAlignment = .center
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1
        verticalStackView.distribution = .equalCentering
        
        horizontalOneStackView.axis = .horizontal
        horizontalOneStackView.spacing = 1
        
        horizontalTwoStackView.axis = .horizontal
        horizontalTwoStackView.spacing = 1
        
        horizontalThreeStackView.axis = .horizontal
        horizontalThreeStackView.spacing = 1
        
        labelOne.text = "Label 1"
        labelOne.textColor = .colorDescription
        labelTwo.text = "Label 2"
        labelTwo.font = UIFont.boldSystemFont(ofSize: 16)
        labelTwo.textColor = .colorText
        
        labelThree.text = "Label 3"
        labelThree.textColor = .colorDescription
        labelFour.text = "Label 4"
        labelFour.font = UIFont.boldSystemFont(ofSize: 16)
        labelFour.textColor = .colorText
        
        labelFive.text = "Label 5"
        labelFive.textColor = .colorDescription
        labelSix.text = "Label 6"
        labelSix.font = UIFont.boldSystemFont(ofSize: 16)
        labelSix.textColor = .colorText
    }
}

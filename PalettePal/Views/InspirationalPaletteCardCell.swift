import Foundation
import UIKit

class InspirationalPaletteCardCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let id = "InspirationalPaletteCardCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = DesignConstants.defaultCornerRadius
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let inspirationalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let paletteCard: PaletteCard = {
        let paletteCard = PaletteCard(style: .squared)
        paletteCard.clipsToBounds = true
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        return paletteCard
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        containerView.addSubview(inspirationalImageView)
        containerView.addSubview(paletteCard)
        addSubview(containerView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            inspirationalImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            inspirationalImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            inspirationalImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            inspirationalImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.9),
            paletteCard.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: inspirationalImageView.bottomAnchor),
            paletteCard.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 4),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func configure(colors: [UIColor], name: String, imageName: String) {
        self.paletteCard.setPalette(with: colors, animated: false)
        self.nameLabel.text = name
        self.inspirationalImageView.image = UIImage(named: imageName)
    }
}


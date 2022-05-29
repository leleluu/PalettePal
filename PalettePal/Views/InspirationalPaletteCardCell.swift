import Foundation
import UIKit

class InspirationalPaletteCardCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let id = "InspirationalPaletteCardCell"
    
    private var paletteCard = PaletteCard()
    
    private let inspirationalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(paletteCard)
        addSubview(nameLabel)
        addSubview(inspirationalImageView)
        
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inspirationalImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            inspirationalImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            inspirationalImageView.topAnchor.constraint(equalTo: topAnchor),
            inspirationalImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
            paletteCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: inspirationalImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: paletteCard.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func configure(palette: [UIColor], name: String, imageName: String) {
        self.paletteCard.setPalette(palette)
        self.nameLabel.text = name
        self.inspirationalImageView.image = UIImage(named: imageName)
    }
}


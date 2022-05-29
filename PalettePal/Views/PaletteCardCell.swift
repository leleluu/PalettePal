import UIKit

class PaletteCardCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let id = "PaletteCardCell"
    private var paletteCard = PaletteCard()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
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
        
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paletteCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: paletteCard.bottomAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    func configure(palette: [UIColor], name: String) {
        self.paletteCard.setPalette(palette)
        self.nameLabel.text = name
    }
}

import UIKit

class ColorCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let id = "ColorCell"
    
    lazy var rgbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
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
        addSubview(rgbLabel)
        addSubview(hexLabel)
        
        NSLayoutConstraint.activate([
            rgbLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rgbLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rgbLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hexLabel.leadingAnchor.constraint(equalTo: rgbLabel.leadingAnchor),
            hexLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            hexLabel.topAnchor.constraint(equalTo: rgbLabel.bottomAnchor)
        ])
    }
}

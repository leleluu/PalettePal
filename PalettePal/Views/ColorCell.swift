import UIKit

class ColorCell: UICollectionViewCell {
    
    // MARK: - Properties

    static let id = "ColorCell"
    
    lazy var colorSwatch: UIView = {
        let swatch = UIView()
        swatch.translatesAutoresizingMaskIntoConstraints = false
        return swatch
    }()
    
    lazy var rgbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
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
        addSubview(colorSwatch)
        addSubview(rgbLabel)
        addSubview(hexLabel)
        
        NSLayoutConstraint.activate([
            colorSwatch.topAnchor.constraint(equalTo: topAnchor),
            colorSwatch.bottomAnchor.constraint(equalTo: bottomAnchor),
            colorSwatch.leadingAnchor.constraint(equalTo: leadingAnchor),
            colorSwatch.widthAnchor.constraint(equalToConstant: 100),
            rgbLabel.leadingAnchor.constraint(equalTo: colorSwatch.trailingAnchor, constant: 16),
            rgbLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            rgbLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            hexLabel.leadingAnchor.constraint(equalTo: rgbLabel.leadingAnchor),
            hexLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            hexLabel.topAnchor.constraint(equalTo: rgbLabel.bottomAnchor)
        ])
    }
}

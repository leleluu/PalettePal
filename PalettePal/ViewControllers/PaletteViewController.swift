import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    private var paletteCard: PaletteCard
    
    
    private let hexLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rgbLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    init(palette: [UIColor], name: String) {
        self.palette = palette
        self.paletteCard = PaletteCard(palette: palette)
        super.init(nibName: nil, bundle: nil)
        self.title = name

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        view.addSubview(hexLabel)
        view.addSubview(rgbLabel)
        
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        hexLabel.text = "\(palette[0].hexString) \(palette[1].hexString) \(palette[2].hexString) \(palette[3].hexString) \(palette[4].hexString)"
        
        rgbLabel.text = "\(palette[0].rgbString) \(palette[1].rgbString) \(palette[2].rgbString) \(palette[3].rgbString) \(palette[4].rgbString)"

        
        NSLayoutConstraint.activate([
            paletteCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paletteCard.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteCard.heightAnchor.constraint(equalToConstant: 100),
            hexLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            hexLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            hexLabel.topAnchor.constraint(equalTo: paletteCard.bottomAnchor, constant: 32),
            rgbLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            rgbLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            rgbLabel.topAnchor.constraint(equalTo: hexLabel.bottomAnchor, constant: 24),
            
        ])
    }

}


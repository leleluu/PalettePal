import UIKit

class PaletteColorPicker: UIControl {
    
    // MARK: - Public Properties
    
    public var selectedColor: UIColor
    
    // MARK: - Private Properties
    
    private let palette: Palette
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initialization
    
    init(with palette: Palette) {
        self.palette = palette
        self.selectedColor = palette.colors[0]

        super.init(frame: .zero)
        
        for color in palette.colors {
            let button = UIButton()
            button.layer.cornerRadius = 10
            
            button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            button.layer.shadowOpacity = 0.8
            button.layer.shadowRadius = 1.0
            button.layer.shadowColor = UIColor.lightGray.cgColor
            
            button.addTarget(self, action: #selector(didTapColor(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = color
            stackView.addArrangedSubview(button)
        }
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupSubviews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    @objc func didTapColor(_ sender: UIButton) {
        selectedColor = sender.backgroundColor!
        sendActions(for: .valueChanged)
    }
    
}

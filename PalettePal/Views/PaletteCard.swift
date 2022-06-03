import UIKit

class PaletteCard: UIView {
    
    enum CornerStyle: String {
        case squared
        case rounded
    }
    
    // MARK: - Properties

    private var style: CornerStyle
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        if style == .rounded {
            stackView.layer.cornerRadius = 5
            stackView.layer.masksToBounds = true
        }
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.addArrangedSubview(UIView())
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    

    // MARK: - Initialization
    
    init(style: CornerStyle) {
        self.style = style
        super.init(frame: .zero)
        setupSubviews()
        
    }
    
    convenience init(palette: [UIColor], style: CornerStyle) {
        self.init(style: style)
        self.style = style
        setPalette(palette)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    // MARK: - Public Method
    
    func setPalette(_ palette: [UIColor]) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            self?.stackView.arrangedSubviews[0].backgroundColor = palette[0]
            self?.stackView.arrangedSubviews[1].backgroundColor = palette[1]
            self?.stackView.arrangedSubviews[2].backgroundColor = palette[2]
            self?.stackView.arrangedSubviews[3].backgroundColor = palette[3]
            self?.stackView.arrangedSubviews[4].backgroundColor = palette[4]
        }


    }
}


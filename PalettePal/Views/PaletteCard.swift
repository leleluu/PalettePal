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
            stackView.layer.cornerRadius = DesignConstants.defaultCornerRadius
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
    
    convenience init(colors: [UIColor], style: CornerStyle) {
        self.init(style: style)
        setPalette(with: colors, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupSubviews() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // MARK: - Public Method
    
    func setPalette(with colors: [UIColor], animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.5) { [weak self] in
                self?.stackView.arrangedSubviews[0].backgroundColor = colors[0]
                self?.stackView.arrangedSubviews[1].backgroundColor = colors[1]
                self?.stackView.arrangedSubviews[2].backgroundColor = colors[2]
                self?.stackView.arrangedSubviews[3].backgroundColor = colors[3]
                self?.stackView.arrangedSubviews[4].backgroundColor = colors[4]
            }
        } else {
            self.stackView.arrangedSubviews[0].backgroundColor = colors[0]
            self.stackView.arrangedSubviews[1].backgroundColor = colors[1]
            self.stackView.arrangedSubviews[2].backgroundColor = colors[2]
            self.stackView.arrangedSubviews[3].backgroundColor = colors[3]
            self.stackView.arrangedSubviews[4].backgroundColor = colors[4]
        }
    }
}


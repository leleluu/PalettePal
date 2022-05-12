import UIKit

class PaletteCard: UIView {
    
    // MARK: - Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    init(palette: [UIColor]) {
        self.init()
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
        stackView.arrangedSubviews[0].backgroundColor = palette[0]
        stackView.arrangedSubviews[1].backgroundColor = palette[1]
        stackView.arrangedSubviews[2].backgroundColor = palette[2]
        stackView.arrangedSubviews[3].backgroundColor = palette[3]
        stackView.arrangedSubviews[4].backgroundColor = palette[4]

    }
}


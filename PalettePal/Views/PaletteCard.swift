import UIKit

class PaletteCard: UIView {
    
    // MARK: - Properties
    
    let stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIView(),
            UIView(),
            UIView(),
            UIView(),
            UIView(),
        ])
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .yellow
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


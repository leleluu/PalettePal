import UIKit

class RandomPaletteViewController: UIViewController {

    // MARK: - Private Properties
    
    private lazy var generateRandomPaletteButton: UIButton = {
        let button = UIButton()
        button.setTitle("random color palette button", for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapGenerateRandomPaletteButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(generateRandomPaletteButton)
        
        NSLayoutConstraint.activate([
            generateRandomPaletteButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            generateRandomPaletteButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            generateRandomPaletteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func didTapGenerateRandomPaletteButton() {
        
    }
}


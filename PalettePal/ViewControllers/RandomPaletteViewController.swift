import UIKit

class RandomPaletteViewController: UIViewController {

    // MARK: - Private Properties
    
    private let apiClient = APIClient()
    private var randomColorPalette: [UIColor] = []
    private let spinner = UIActivityIndicatorView()
    
    private lazy var paletteCard: PaletteCard = {

        let card = PaletteCard(style: .rounded)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let toolTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap the button below or shake your device to generate a random color palette!"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var generateRandomPaletteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Generate", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28)
        button.setTitle("", for: .disabled)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1.5
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 3.0
        button.layer.shadowColor = UIColor.gray.cgColor
        
        button.addTarget(self, action: #selector(didTapGenerateRandomPalette), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(didTapSave))
        navigationItem.title = "Palette Generator"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        setupViews()
        showRandomPalette()
    }
    
    override func viewDidLayoutSubviews() {
        generateRandomPaletteButton.layer.cornerRadius = generateRandomPaletteButton.frame.height / 2

    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        view.addSubview(toolTipLabel)
        view.addSubview(generateRandomPaletteButton)
        generateRandomPaletteButton.addSubview(spinner)
        
        spinner.translatesAutoresizingMaskIntoConstraints = false

        
        NSLayoutConstraint.activate([
            paletteCard.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            paletteCard.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            paletteCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            paletteCard.heightAnchor.constraint(equalToConstant: 300),
            toolTipLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 8),
            toolTipLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -8),
            toolTipLabel.bottomAnchor.constraint(equalTo: generateRandomPaletteButton.topAnchor, constant: -32),
            generateRandomPaletteButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            generateRandomPaletteButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16),
            generateRandomPaletteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            generateRandomPaletteButton.heightAnchor.constraint(equalToConstant: 56),
            generateRandomPaletteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            spinner.centerXAnchor.constraint(equalTo: generateRandomPaletteButton.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: generateRandomPaletteButton.centerYAnchor)
        ])
    }
    
    private func showRandomPalette() {

        spinner.startAnimating()
        generateRandomPaletteButton.isEnabled = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        apiClient.fetchRandomPalette { palette in
            let newColorPalette = palette.result.map { rgb in
                UIColor(rgb: rgb)
            }
            DispatchQueue.main.async { [self] in

                self.randomColorPalette = newColorPalette
                self.paletteCard.setPalette(randomColorPalette)
                spinner.stopAnimating()
                generateRandomPaletteButton.isEnabled = true
                navigationItem.rightBarButtonItem?.isEnabled = true
            }
        }
    }
    
    @objc private func didTapGenerateRandomPalette() {
        showRandomPalette()
    }
    
    @objc private func didTapSave() {
        let savePaletteViewController = SavePaletteViewController(palette: self.randomColorPalette)
        let navController = UINavigationController(rootViewController: savePaletteViewController)
        present(navController, animated: true)
    }
}

import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    
    private lazy var paletteCard: PaletteCard = {
        let card = PaletteCard()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = .yellow
        card.stackView.subviews[0].backgroundColor = palette[0]
        card.stackView.subviews[1].backgroundColor = palette[1]
        card.stackView.subviews[2].backgroundColor = palette[2]
        card.stackView.subviews[3].backgroundColor = palette[3]
        card.stackView.subviews[4].backgroundColor = palette[4]
        return card
    }()
    
    // MARK: - Initialization
    
    init(palette: [UIColor], name: String) {
        self.palette = palette
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        paletteCard.backgroundColor = palette[0]
        
        NSLayoutConstraint.activate([
            paletteCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paletteCard.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteCard.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

}


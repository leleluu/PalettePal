import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    private var paletteCard: PaletteCard
    
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(didTapBack))

        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
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


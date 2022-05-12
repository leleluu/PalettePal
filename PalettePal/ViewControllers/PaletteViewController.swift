import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    
    private lazy var swatch: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
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
        view.addSubview(swatch)
        swatch.backgroundColor = palette[0]
        
        NSLayoutConstraint.activate([
            swatch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            swatch.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            swatch.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            swatch.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

}


import UIKit

class EditPaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    
    private lazy var swatch: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - Initialization
    
    init(palette: [UIColor]) {
        self.palette = palette
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
        
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(swatch)
        swatch.backgroundColor = palette[0]

        
        NSLayoutConstraint.activate([
            swatch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            swatch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            swatch.heightAnchor.constraint(equalToConstant: 100),
            swatch.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc private func didTapSave() {
        print("tapped save")
        print(palette)
        dismiss(animated: true)
    }
}


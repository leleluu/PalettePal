import UIKit


class SavePaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var colors: [UIColor]
    private var paletteCard: PaletteCard

    
    private lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Palette Name"
        textfield.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        textfield.keyboardType = .alphabet
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        textfield.accessibilityIdentifier = "palette name textfield"
        return textfield
    }()
    
    // MARK: - Initialization
    
    init(colors: [UIColor]) {
        self.colors = colors
        self.paletteCard = PaletteCard(colors: colors, style: .rounded)
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
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        view.addSubview(nameTextField)
        
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
            paletteCard.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteCard.heightAnchor.constraint(equalToConstant: DesignConstants.defaultPaletteCardHeight)
        ])
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true)
    }
    
    @objc private func didTapSave() {
        
        if let name = nameTextField.text, nameTextField.text?.isEmpty == false {
            let newPalette = Palette(name: name, colors: colors)
            Palettes.addPalette(palette: newPalette)
        } else {
        // TODO: Show error when text field is empty and also treat textfield with white space as empty
            print("text field is empty, show error")
        }
        
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension SavePaletteViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        didTapSave()
        return true
    }
    
}

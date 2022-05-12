import UIKit

class EditPaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    
    private lazy var nameTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "palette name"
        textfield.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        textfield.keyboardType = .alphabet
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.delegate = self
        return textfield
    }()
    
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
        nameTextField.becomeFirstResponder()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(swatch)
        view.addSubview(nameTextField)
        swatch.backgroundColor = palette[0]
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            swatch.topAnchor.constraint(equalTo: nameTextField.bottomAnchor),
            swatch.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            swatch.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            swatch.heightAnchor.constraint(equalToConstant: 100)
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

// MARK: - UITextFieldDelegate

extension EditPaletteViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        didTapSave()
        return true
    }
    
}

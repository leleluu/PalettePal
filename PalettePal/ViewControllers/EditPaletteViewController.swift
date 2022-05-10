import UIKit

class EditPaletteViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
    }
    
    // MARK: - Private Methods
    
    @objc private func didTapCancel() {
        dismiss(animated: true)
    }
}


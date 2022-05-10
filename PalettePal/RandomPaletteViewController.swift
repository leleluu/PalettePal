import UIKit

class RandomPaletteViewController: UIViewController {

    // MARK: - Private Properties
    
    private let apiClient = APIClient()
    private var randomColorPalette: [UIColor] = []
    private var layout = UICollectionViewFlowLayout()

    private lazy var generateRandomPaletteButton: UIButton = {
        let button = UIButton()
        button.setTitle("random color palette button", for: .normal)
        button.backgroundColor = UIColor.systemYellow
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapGenerateRandomPaletteButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.id)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
        showRandomPalette()
    }
    
    override func viewDidLayoutSubviews() {
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(generateRandomPaletteButton)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            generateRandomPaletteButton.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
            generateRandomPaletteButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 50),
            generateRandomPaletteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func showRandomPalette() {
        apiClient.fetchRandomPalette { palette in
            let newColorPalette = palette.result.map { rgb in
                UIColor(rgb: rgb)
            }
            
            DispatchQueue.main.async { [self] in
                self.randomColorPalette = newColorPalette
                self.collectionView.reloadData()
            }
        }
    }
    
    @objc private func didTapGenerateRandomPaletteButton() {
        showRandomPalette()
    }
    
}

// MARK:- UICollectionViewDataSource

extension RandomPaletteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomColorPalette.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.id, for: indexPath) as! ColorCell
        let color = randomColorPalette[indexPath.row]
        cell.backgroundColor = color
        cell.rgbLabel.text = color.rgbString
        cell.hexLabel.text = color.hexString
        return cell
    }
    
}

import UIKit

class RandomPaletteViewController: UIViewController {

    // MARK: - Private Properties
    
    private let apiClient = APIClient()
    private var randomColorPalette: [UIColor] = []
    private var layout = UICollectionViewFlowLayout()
    static private let cellReuseIdentifier = "ColorCell"

    private lazy var generateRandomPaletteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tap here for random palette", for: .normal)
        button.backgroundColor = UIColor.white
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.addTarget(self, action: #selector(didTapGenerateRandomPalette), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.minimumInteritemSpacing = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: RandomPaletteViewController.cellReuseIdentifier)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"), style: .plain, target: self, action: #selector(didTapSave))
        navigationItem.title = "Palette Generator"
        setupViews()
        showRandomPalette()
    }
    
    override func viewDidLayoutSubviews() {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        layout.itemSize = CGSize(width: width / 5, height: height)
        //check
        generateRandomPaletteButton.layer.cornerRadius = generateRandomPaletteButton.frame.height / 2
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(generateRandomPaletteButton)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            generateRandomPaletteButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            generateRandomPaletteButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16),
            generateRandomPaletteButton.heightAnchor.constraint(equalToConstant: 64),
            generateRandomPaletteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
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
    
    @objc private func didTapGenerateRandomPalette() {
        showRandomPalette()
    }
    
    @objc private func didTapSave() {
        print("didtapsave")
        let editPaletteViewController = EditPaletteViewController(palette: self.randomColorPalette)
        let navController = UINavigationController(rootViewController: editPaletteViewController)
        present(navController, animated: true)
    }
    
}

// MARK: - UICollectionViewDataSource

extension RandomPaletteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomColorPalette.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RandomPaletteViewController.cellReuseIdentifier, for: indexPath)
        let color = randomColorPalette[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
}

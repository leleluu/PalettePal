import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: [UIColor]
    private var paletteCard: PaletteCard
    private var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.id)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
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
        setupNavBar()
        setupViews()
    }
    
    override func viewDidLayoutSubviews() {
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(paletteCard)
        view.addSubview(collectionView)
        
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            paletteCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paletteCard.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteCard.heightAnchor.constraint(equalToConstant: 70),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: paletteCard.bottomAnchor, constant: 32),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
        
    private func setupNavBar() {
        
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
            self.presentShareSheet()
        }
        
        let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { action in
        }
    
        let menuBarButton = UIBarButtonItem(
            title: "More",
            image: UIImage(systemName: "ellipsis.circle"),
            primaryAction: nil,
            menu: UIMenu(
                title: "",
                children: [shareAction, deleteAction]
            )
        )
    
        navigationItem.rightBarButtonItem = menuBarButton
    }

}

// MARK: - UICollectionViewDataSource

extension PaletteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return palette.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.id, for: indexPath) as! ColorCell
        let color = palette[indexPath.row]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.colorSwatch.backgroundColor = color
        cell.layer.borderWidth = 1 / UIScreen.main.scale
        cell.rgbLabel.text = color.rgbString
        cell.hexLabel.text = color.hexString
        return cell
    }
}

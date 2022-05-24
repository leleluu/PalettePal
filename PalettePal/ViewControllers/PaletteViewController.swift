import UIKit

class PaletteViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: Palette
    private var paletteCard: PaletteCard
    private var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.id)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Initialization
    
    init(palette: Palette) {
        self.palette = palette
        self.paletteCard = PaletteCard(palette: palette.colors)
        super.init(nibName: nil, bundle: nil)
        self.title = palette.name
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
    
    private func presentShareSheet() {

        let rgbValues = palette.colors.map { color in
            color.rgbString
        }
        let hexValues = palette.colors.map { color in
            color.hexString
        }
        
        let textToShare = "RGB: \(rgbValues), Hex: \(hexValues)"
        
        let shareSheetVC = UIActivityViewController(activityItems: [textToShare],
            applicationActivities: nil
        )
        shareSheetVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(shareSheetVC, animated: true)
    }
    
    private func setupNavBar() {
        
        let shareAction = UIAction(title: "Share", image: UIImage(systemName: "square.and.arrow.up")) { action in
            self.presentShareSheet()
        }
        
        let deleteAction = UIAction(title: "Delete", image: UIImage(systemName: "trash")) { [weak self] action in
            
            guard let palette = self?.palette else { return }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            let delete = UIAlertAction(title: "Delete", style: .destructive) { [weak self] action in
                Palettes.remove(palette)
                self?.navigationController?.popViewController(animated: true)
            }
                        
            let alert = UIAlertController(title: "Delete Palette", message: "Are you sure you want to delete the palette \(palette.name)?", preferredStyle: .alert)
            
            alert.addAction(cancel)
            alert.addAction(delete)
            
            self?.present(alert, animated: true, completion: nil)
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
    
        let pencilButton = UIBarButtonItem(image: UIImage(systemName: "pencil.tip.crop.circle"), style: .plain, target: self, action: #selector(didTapPencil)
        )
        
        navigationItem.rightBarButtonItems = [menuBarButton, pencilButton]
    }
    
    @objc func didTapPencil() {
        let thumbnailSketchViewController = ThumbnailSketchViewController(palette: palette)
        let navigationController = UINavigationController(rootViewController: thumbnailSketchViewController)
        navigationController.isModalInPresentation = true
        present(navigationController, animated: true)

    }

}

// MARK: - UICollectionViewDataSource

extension PaletteViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return palette.colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.id, for: indexPath) as! ColorCell
        let color = palette.colors[indexPath.row]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.colorSwatch.backgroundColor = color
        cell.layer.borderWidth = 1 / UIScreen.main.scale
        cell.rgbLabel.text = color.rgbString
        cell.hexLabel.text = color.hexString
        return cell
    }
}

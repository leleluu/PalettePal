import UIKit

class InspirationViewController: UIViewController {

    // MARK: - Private Properties
        
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(InspirationalPaletteCardCell.self, forCellWithReuseIdentifier: InspirationalPaletteCardCell.id)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupViews()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {

        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        

        let inset: CGFloat = 5
        item.contentInsets = NSDirectionalEdgeInsets(
          top: inset,
          leading: inset,
          bottom: inset,
          trailing: inset
        )
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(4/5), heightDimension: .fractionalWidth(2/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        
        // Header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [headerItem]
        section.interGroupSpacing = CGFloat(24)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
    
// MARK: - UICollectionViewDataSource

extension InspirationViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DummyData.inspirationalPaletteCollections.count
    }
         
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.id, for: indexPath) as! HeaderView
        header.titleLabel.text = "Section \(indexPath.section)"
        return header
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return DummyData.inspirationalPaletteCollections[0].palettes.count
        } else {
            return DummyData.inspirationalPaletteCollections[1].palettes.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InspirationalPaletteCardCell.id, for: indexPath) as! InspirationalPaletteCardCell
        if indexPath.section == 0 {
            let collection = DummyData.inspirationalPaletteCollections[0]
            let palette = collection.palettes[indexPath.row]
            cell.configure(palette: palette.colors, name: palette.name, imageName: palette.imageName)
        } else {
            let collection = DummyData.inspirationalPaletteCollections[1]
            let palette = collection.palettes[indexPath.row]
            cell.configure(palette: palette.colors, name: palette.name, imageName: palette.imageName)
        }
        return cell
    }
}


// MARK: -  UICollectionViewDelegate

extension InspirationViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let collection = DummyData.inspirationalPaletteCollections[indexPath.section]
        
        let selectedPalette = collection.palettes[indexPath.row]
        
        let paletteViewController = PaletteViewController(palette: selectedPalette.palette)
        navigationController?.pushViewController(paletteViewController, animated: true)
    }
}

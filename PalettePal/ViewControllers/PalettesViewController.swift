import UIKit

class PalettesViewController: UIViewController, UISearchControllerDelegate {
    
    // MARK: - Private Properties

    private var filteredPalettes: [Palette] = []
    private var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    private var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }

    private var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search for a palette"
        return searchController
       }()
       
    private var layout = UICollectionViewFlowLayout()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(PaletteCardCell.self, forCellWithReuseIdentifier: PaletteCardCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "My Palettes"
        
        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    override func viewDidLayoutSubviews() {
        if layout.itemSize.width == collectionView.frame.width {
            return
        }
        let width = collectionView.frame.width
        layout.itemSize = CGSize(width: width, height: 100)
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func filterContentForSearchText(searchText: String) {
        filteredPalettes = Palettes.all.filter({ palette in
            palette.name.lowercased().contains(searchText.lowercased())
        })
        collectionView.reloadData()
        
    }
}

// MARK: - UICollectionViewDataSource

extension PalettesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
          return filteredPalettes.count
        }
        return Palettes.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaletteCardCell.id, for: indexPath) as! PaletteCardCell
        
        let palette: Palette
        if isFiltering {
          palette = filteredPalettes[indexPath.row]
        } else {
          palette = Palettes.all[indexPath.row]
        }
        
        cell.configure(palette: palette.colors, name: palette.name)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PalettesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedPalette: Palette
        
        if isFiltering {
            selectedPalette = filteredPalettes[indexPath.row]
        } else {
            selectedPalette = Palettes.all[indexPath.row]
        }
        
        let paletteViewController = PaletteViewController(palette: selectedPalette)
        navigationController?.pushViewController(paletteViewController, animated: true)
    }
}

// MARK: - UISearchResultsUpdating

extension PalettesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchText: searchBar.text!)
    }
}

import UIKit
import PencilKit

class SketchPadViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: Palette
    private var paletteCard: PaletteCard
    
    private lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView(frame: .zero)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.borderColor = UIColor.lightGray.cgColor
        canvasView.layer.borderWidth = 1 / UIScreen.main.scale
        canvasView.tool = PKInkingTool(.pen, color: palette.colors[0], width: 30)
        canvasView.drawingPolicy = .anyInput
        
        canvasView.drawing = PKDrawing()
        canvasView.becomeFirstResponder()
        return canvasView
    }()
    
    private lazy var paletteColorPicker: PaletteColorPicker = {
        let colorPicker = PaletteColorPicker(with: palette)
        colorPicker.translatesAutoresizingMaskIntoConstraints = false
        colorPicker.addTarget(self, action: #selector(didChangeColor), for: .valueChanged)
        return colorPicker
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavBar()
        setupViews()
    }
    
    // MARK: - Initialization
    
    init(palette: Palette) {
        self.palette = palette
        self.paletteCard = PaletteCard(palette: palette.colors, style: .rounded)
        super.init(nibName: nil, bundle: nil)
    
        self.title = palette.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupNavBar() {
        let undoButton = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward"), style: .plain, target: self, action: #selector(didTapUndo))
        
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Discard", style: .plain, target: self, action: #selector(didTapCancel))
        
        navigationItem.rightBarButtonItems = [saveButton, undoButton]
    }
    
    private func setupViews() {

        view.addSubview(canvasView)
        view.addSubview(paletteColorPicker)
        view.addSubview(paletteCard)
        paletteCard.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            paletteColorPicker.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paletteColorPicker.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paletteColorPicker.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            paletteColorPicker.bottomAnchor.constraint(equalTo: canvasView.topAnchor, constant: -64),
            paletteColorPicker.heightAnchor.constraint(equalToConstant: 70),
            canvasView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            canvasView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paletteCard.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 10),
            paletteCard.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
        
    @objc func didChangeColor(_ sender: PaletteColorPicker) {

        if var currentTool = canvasView.tool as? PKInkingTool {
            currentTool.color = sender.selectedColor 
            canvasView.tool = currentTool
        }
    }
    
    @objc func didTapCancel() {
        dismiss(animated: true)
        
    }
    
    @objc func didTapUndo() {
        if canvasView.drawing.strokes.isEmpty {
            return
        } else {
            canvasView.drawing.strokes.removeLast()
        }
    }
    
    @objc func didTapSave() {            
            let drawing = canvasView.drawing
            let canvasRect = canvasView.bounds
            let image = drawing.image(from: canvasRect, scale: UIScreen.main.scale)
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        if let error = error {
            let alert = UIAlertController(title: "Saving Failed", message: "\(error.localizedDescription). Please check in Settings to make sure you have allowed us access to your photo library.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alert, animated: true)
            
            
        } else {
            let alert = UIAlertController(title: "Saved", message: "Your sketch has been successfully saved to your photo library.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {  [weak self] action in
                self?.dismiss(animated: true)
            }))
            present(alert, animated: true)
        }
        
    }
    
}

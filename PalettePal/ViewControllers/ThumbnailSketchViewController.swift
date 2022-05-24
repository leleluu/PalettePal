import UIKit
import PencilKit

class ThumbnailSketchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var palette: Palette
    private var paletteCard: PaletteCard
    
    private lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView(frame: .zero)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.delegate = self
        canvasView.layer.borderColor = UIColor.lightGray.cgColor
        canvasView.layer.borderWidth = 1 / UIScreen.main.scale
        canvasView.tool = PKInkingTool(.pen, color: palette.colors[0], width: 30)
        canvasView.drawingPolicy = .anyInput
        
        canvasView.drawing = PKDrawing()
        canvasView.becomeFirstResponder()
        return canvasView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor
        
        button.addTarget(self, action: #selector(didTapColor(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor
        
        button.addTarget(self, action: #selector(didTapColor), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor

        button.addTarget(self, action: #selector(didTapColor(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonFour: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor

        button.addTarget(self, action: #selector(didTapColor(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonFive: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        
        button.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        button.layer.shadowOpacity = 0.8
        button.layer.shadowRadius = 1.0
        button.layer.shadowColor = UIColor.lightGray.cgColor
        
        button.addTarget(self, action: #selector(didTapColor(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        self.paletteCard = PaletteCard(palette: palette.colors)
        super.init(nibName: nil, bundle: nil)
        
        self.buttonOne.backgroundColor = palette.colors[0]
        self.buttonTwo.backgroundColor = palette.colors[1]
        self.buttonThree.backgroundColor = palette.colors[2]
        self.buttonFour.backgroundColor = palette.colors[3]
        self.buttonFive.backgroundColor = palette.colors[4]
        self.title = palette.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupNavBar() {
        let undoButton = UIBarButtonItem(image: UIImage(systemName: "arrow.uturn.backward"), style: .plain, target: self, action: #selector(didTapUndo))
        
        let saveButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.down"), style: .done, target: self, action: #selector(didTapSave))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
        navigationItem.rightBarButtonItems = [saveButton, undoButton]
    }
    
    private func setupViews() {

        view.addSubview(canvasView)
        view.addSubview(stackView)
        view.addSubview(paletteCard)
        paletteCard.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        stackView.addArrangedSubview(buttonFour)
        stackView.addArrangedSubview(buttonFive)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            stackView.bottomAnchor.constraint(equalTo: canvasView.topAnchor, constant: -64),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            canvasView.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            canvasView.heightAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paletteCard.leadingAnchor.constraint(equalTo: canvasView.leadingAnchor),
            paletteCard.trailingAnchor.constraint(equalTo: canvasView.trailingAnchor),
            paletteCard.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 10),
            paletteCard.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
        
    @objc func didTapColor(_ sender: UIButton) {

        guard let color = sender.backgroundColor else {
            return
        }
        
        if var currentTool = canvasView.tool as? PKInkingTool {
            currentTool.color = color
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
        print("did tap save")
    }
}

extension ThumbnailSketchViewController: PKCanvasViewDelegate {
    
}


import UIKit
import CoreGraphics

class ViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = true
        scroll.alwaysBounceVertical = true
        scroll.backgroundColor = .white
        scroll.keyboardDismissMode = .onDrag
        scroll.delegate = self
        //scroll.backgroundColor = #colorLiteral(red: 0.9490073323, green: 0.9455509782, blue: 0.9702795148, alpha: 1)
        
        return scroll
    }()
    
    let imageView: UIImageView = {
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 36)
        let personSymbol = UIImage(systemName: "person.crop.circle.fill", withConfiguration: symbolConfig)
        
        let imageView = UIImageView(image: personSymbol)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 8
        imageView.layer.zPosition = -1
        imageView.tintColor = .systemRed
        
        return imageView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    lazy var navigationMaskView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubview()
        setupViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Создание и настройка интерфейса
    
    func setupViews() {
        navigationItem.title = "Avatar"
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.standardAppearance.configureWithOpaqueBackground()
    }
    
    func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.addSubview(imageView)
        navigationBar.addSubview(navigationMaskView)
    }
    
    func setupConstraints() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        
        NSLayoutConstraint.activate([
            navigationMaskView.topAnchor.constraint(equalTo: navigationBar.topAnchor, constant: 0),
            navigationMaskView.leadingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: -50),
            navigationMaskView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor, constant: 0),
            navigationMaskView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -16).isActive = true
        imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -6).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    }

}

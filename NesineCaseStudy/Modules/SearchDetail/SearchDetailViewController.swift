//
//  SearchDetailViewController.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import UIKit

final class SearchDetailViewController: UIViewController {
    
    // MARK: Properties
    
    var presenter: ISearchDetailPresenter?
    
    // MARK: Views
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
}

extension SearchDetailViewController: ISearchDetailView {
    
    func setupNavigationBar(title: String) {
        navigationItem.title = title
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    func setupImageView(imageData: Data) {
        imageView.image = .init(data: imageData)
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
}

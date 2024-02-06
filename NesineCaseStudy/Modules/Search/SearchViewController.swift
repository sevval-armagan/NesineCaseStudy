//
//  SearchViewController.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: Properties
    
    private var sink: Any?
    
    var presenter: ISearchPresenter?
    var adapter: SearchAdapter?
    
    // MARK: Views
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.tintColor = UIColor.black.withAlphaComponent(1.0)
        searchBar.placeholder = "Search for app"
        searchBar.backgroundColor = UIColor.clear
        searchBar.barTintColor = UIColor.clear
        searchBar.searchBarStyle = .minimal
        searchBar.returnKeyType = .search
        searchBar.showsCancelButton = false
        searchBar.showsBookmarkButton = false
        searchBar.sizeToFit()
        return searchBar
    }()
    
    private lazy var collectionView = UICollectionView(
        frame: view.frame,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
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

extension SearchViewController: ISearchView {
    
    func setupNavigationBar() {
        navigationItem.titleView = searchBar
    }
    
    func setupSearchBar() {
        
    }
    
    func setupSearchBarListeners() {
        sink = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: searchBar.searchTextField)
            .compactMap { ($0.object as? UITextField)?.text }
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self else {
                    return
                }
                
                presenter?.searchBarTextDidChange(query: query)
            }
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = adapter
        collectionView.dataSource = adapter
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "cellId")
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

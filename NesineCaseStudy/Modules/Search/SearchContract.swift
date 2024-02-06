//
//  SearchContract.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import Foundation

protocol ISearchView: AnyObject {
    
    func setupNavigationBar()
    func setupSearchBar()
    func setupSearchBarListeners()
    func setupCollectionView()
    func reloadData()
}

protocol ISearchPresenter: AnyObject {
    
    func viewDidLoad()
    func viewWillAppear()
    
    func getApps() -> [SearchResult]
    
    func searchBarTextDidChange(query: String)
    func didSelectItemAt(index: Int)
}

protocol ISearchInteractor: AnyObject {
    
    func fetchApps(query: String)
    
    func getApps() -> [SearchResult]?
}

protocol ISearchInteractorToPresenter: AnyObject {
    
    func fetchAppsSuccess()
    func fetchAppsFailure(error: Error?)
}

protocol ISearchRouter: AnyObject {
}

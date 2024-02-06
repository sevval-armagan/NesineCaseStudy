//
//  SearchPresenter.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import Foundation

final class SearchPresenter {
    
    // MARK: Properties
    
    weak var view: ISearchView?
    var router: ISearchRouter?
    var interactor: ISearchInteractor?
}

extension SearchPresenter: ISearchPresenter {
    
    func viewDidLoad() {
        view?.setupSearchBar()
        view?.setupSearchBarListeners()
        view?.setupCollectionView()
    }
    
    func viewWillAppear() {
        view?.setupNavigationBar()
    }
    
    func getApps() -> [SearchResult] {
        interactor?.getApps() ?? []
    }
    
    func searchBarTextDidChange(query: String) {
        interactor?.fetchApps(query: query)
    }
    
    func handleImageView(imageData: Data) {
        router?.navigateToSearchDetail(imageData: imageData)
    }
}

extension SearchPresenter: ISearchInteractorToPresenter {
    
    func fetchAppsSuccess() {
        view?.reloadData()
    }
    
    func fetchAppsFailure(error: Error?) {
        print(error?.localizedDescription ?? "")
    }
}

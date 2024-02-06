//
//  SearchRouter.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import UIKit

final class SearchRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static Methods
    
    static func setupModule() -> SearchViewController {
        let viewController = SearchViewController()
        let presenter = SearchPresenter()
        let router = SearchRouter()
        let interactor = SearchInteractor()
        let adapter = SearchAdapter(presenter: presenter, view: viewController)
        
        viewController.presenter = presenter
        viewController.adapter = adapter
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension SearchRouter: ISearchRouter {
    
    func navigateToSearchDetail(imageData: Data) {
        let viewController = SearchDetailRouter.setupModule(imageData: imageData)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

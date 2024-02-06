//
//  SearchDetailRouter.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import UIKit

final class SearchDetailRouter {
    
    // MARK: Properties
    
    weak var view: UIViewController?
    
    // MARK: Static Methods
    
    static func setupModule(imageData: Data) -> SearchDetailViewController {
        let viewController = SearchDetailViewController()
        let presenter = SearchDetailPresenter(imageData: imageData)
        let router = SearchDetailRouter()
        let interactor = SearchDetailInteractor()
        
        viewController.presenter = presenter
        viewController.modalPresentationStyle = .fullScreen
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        router.view = viewController
        
        interactor.output = presenter
        
        return viewController
    }
}

extension SearchDetailRouter: ISearchDetailRouter {
}

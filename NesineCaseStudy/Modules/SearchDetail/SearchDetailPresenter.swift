//
//  SearchDetailPresenter.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import Foundation

final class SearchDetailPresenter {
    
    // MARK: Properties
    
    private let imageData: Data
    
    weak var view: ISearchDetailView?
    var router: ISearchDetailRouter?
    var interactor: ISearchDetailInteractor?
    
    init(imageData: Data) {
        self.imageData = imageData
    }
}

extension SearchDetailPresenter: ISearchDetailPresenter {
    
    func viewDidLoad() {
        view?.setupUI()
        view?.setupImageView(imageData: imageData)
    }
    
    func viewWillAppear() {
        view?.setupNavigationBar(title: "Image")
    }
}

extension SearchDetailPresenter: ISearchDetailInteractorToPresenter {
}

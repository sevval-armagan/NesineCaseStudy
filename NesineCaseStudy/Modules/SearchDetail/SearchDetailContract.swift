//
//  SearchDetailContract.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import Foundation

protocol ISearchDetailView: AnyObject {
    
    func setupNavigationBar(title: String)
    func setupUI()
    func setupImageView(imageData: Data)
}

protocol ISearchDetailPresenter: AnyObject {
    
    func viewDidLoad()
    func viewWillAppear()
}

protocol ISearchDetailInteractor: AnyObject {
}

protocol ISearchDetailInteractorToPresenter: AnyObject {
}

protocol ISearchDetailRouter: AnyObject {
}

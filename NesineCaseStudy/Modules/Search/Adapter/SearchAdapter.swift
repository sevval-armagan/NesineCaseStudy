//
//  SearchAdapter.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import UIKit

final class SearchAdapter: NSObject {
    
    // MARK: Properties
    
    private let presenter: ISearchPresenter
    private let view: ISearchView
    
    // MARK: Lifecycle
    
    init(presenter: ISearchPresenter, view: ISearchView) {
        self.presenter = presenter
        self.view = view
    }
}

// MARK: - UICollectionViewDataSource

extension SearchAdapter: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.getApps().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! SearchCell
        
        if let app = presenter.getApps()[safe: indexPath.item] {
            cell.set(
                name: app.trackName ?? "n/a",
                imageUrls: app.screenshotUrls ?? []
            )
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SearchAdapter: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(index: indexPath.item)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 250)
    }
}

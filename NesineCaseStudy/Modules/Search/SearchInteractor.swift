//
//  SearchInteractor.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//  
//

import Foundation

final class SearchInteractor {
    
    // MARK: Properties
    
    private var searchResponse: SearchResponse?
    
    private var task: URLSessionDataTask?
    
    weak var output: ISearchInteractorToPresenter?
    
    func fetchApps(query: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(query)&entity=software") else {
            return
        }
        
        task?.cancel()
        
        task = URLSession.shared.dataTask(with: url) { [weak self] data, resp, error in
            guard let self else {
                return
            }
            
            if let error {
                print("Failed to fetch apps:", error)
                output?.fetchAppsFailure(error: error)
                return
            }
            
            guard let data else {
                print("Failed to fetch apps nil data!")
                output?.fetchAppsFailure(error: nil)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                
                searchResponse = response
                task = nil
                output?.fetchAppsSuccess()
            } catch {
                print("Failed to fetch apps decode json:", error)
                output?.fetchAppsFailure(error: error)
            }
        }
        
        task?.resume()
    }
}

extension SearchInteractor: ISearchInteractor {
    
    func getApps() -> [SearchResult]? {
        searchResponse?.results
    }
}

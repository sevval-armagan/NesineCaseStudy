//
//  SearchResponse.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import Foundation

struct SearchResponse: Decodable {
    
    var results: [SearchResult]?
}

struct SearchResult: Decodable {
    
    var trackName : String?
    var screenshotUrls: [String]?
}

//
//  Collection+Extension.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import Foundation

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

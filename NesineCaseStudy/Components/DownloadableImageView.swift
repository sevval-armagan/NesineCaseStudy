//
//  DownloadableImageView.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import UIKit

final class DownloadableImageView: UIImageView {
    
    private static let operationQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        return queue
    }()
    
    private var task: URLSessionDataTask?
    
    func set(urlString: String?) {
        guard let urlString,
              let url = URL(string: urlString) else {
            image = nil
            return
        }
        
        Self.operationQueue.addOperation { [weak self] in
            guard let self else {
                return
            }
            
            task?.cancel()
            
            let semaphore = DispatchSemaphore(value: 0)
            
            task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil,
                      let data,
                      let image = UIImage(data: data) else {
                    return
                }
                
                DispatchQueue.main.async() { [weak self] in
                    self?.image = image
                    self?.task = nil
                    semaphore.signal()
                }
            }
            
            task?.resume()
            
            semaphore.wait()
        }
    }
    
    func cancelDownload() {
        task?.cancel()
        task = nil
        image = nil
    }
}

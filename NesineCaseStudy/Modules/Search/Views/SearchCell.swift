//
//  SearchCell.swift
//  NesineCaseStudy
//
//  Created by Şevval Armağan on 6.02.2024.
//

import UIKit

final class SearchCell: UICollectionViewCell {
    
    private lazy var generalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imagesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var imageViews: [DownloadableImageView] = {
        (1...3).map { _ in
            let imageView = DownloadableImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.backgroundColor = .lightGray
            imageView.layer.cornerRadius = 4
            imageView.clipsToBounds = true
            return imageView
        }
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [nameLabel, imagesStackView].forEach { view in
            generalStackView.addArrangedSubview(view)
        }
        
        imageViews.forEach { view in
            imagesStackView.addArrangedSubview(view)
        }
        
        addSubview(generalStackView)
        
        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 22),
            generalStackView.topAnchor.constraint(equalTo: topAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageViews.forEach { imageView in
            imageView.cancelDownload()
        }
    }
    
    func set(
        name: String,
        imageUrls: [String]
    ) {
        nameLabel.text = name
        
        imageViews.enumerated().forEach { index, imageView in
            imageView.set(urlString: imageUrls[safe: index])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

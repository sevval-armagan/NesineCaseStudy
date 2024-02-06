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
        return stackView
    }()
    
    private lazy var imageViews: [UIImageView] = {
        (1...3).map { _ in
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
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
            generalStackView.widthAnchor.constraint(equalToConstant: frame.width),
            generalStackView.topAnchor.constraint(equalTo: topAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    func set(
        name: String,
        imagesUrls: [String]
    ) {
        nameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

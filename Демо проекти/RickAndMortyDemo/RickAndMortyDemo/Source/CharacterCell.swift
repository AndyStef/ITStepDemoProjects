//
//  CharacterCell.swift
//  RickAndMortyDemo
//
//  Created by Andy Stef on 05.11.2020.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    static let identifier = "CharacterCell"
    
    lazy var charImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var imageUrl: String = "" {
        didSet {
            DispatchQueue.global().async {
                guard let url = URL(string: self.imageUrl), let data = try? Data(contentsOf: url) else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.charImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(charImageView)
        contentView.addSubview(nameLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        charImageView.translatesAutoresizingMaskIntoConstraints = false
        charImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        charImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        charImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        charImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        charImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerYAnchor.constraint(equalTo: charImageView.centerYAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: charImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        charImageView.image = nil
    }
}

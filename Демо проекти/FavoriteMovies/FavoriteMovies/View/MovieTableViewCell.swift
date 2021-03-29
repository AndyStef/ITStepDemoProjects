//
//  MovieTableViewCell.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let cellID = "MovieTableViewCell"
    
    @IBOutlet private weak var gradientContainerView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet var starsCollection: [UIImageView]!
    
    private var gradientLayer: CAGradientLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupGradientView()
    }
    
    private func setupGradientView() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradientContainerView.bounds
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.2).cgColor, UIColor.black.withAlphaComponent(0.8).cgColor]
        
        gradientContainerView.layer.addSublayer(gradientLayer)
    }
}

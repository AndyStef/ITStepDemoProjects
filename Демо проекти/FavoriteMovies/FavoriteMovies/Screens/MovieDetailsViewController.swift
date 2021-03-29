//
//  MovieDetailsViewController.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 29.03.2021.
//

import UIKit

protocol MovieDetailsViewControllerDelegate: class {
    func didUpdateRatingForMovie(with id: Int, newRating: Int)
}

class MovieDetailsViewController: UIViewController {
    
    var movie: Movie?
    
    weak var delegate: MovieDetailsViewControllerDelegate?
    
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet var ratingCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            setupUI(with: movie)
        }
    }
    
    private func setupUI(with movie: Movie) {
        movieImageView.image = UIImage(named: movie.image)
        nameLabel.text = movie.name
        ratingLabel.text = "\(movie.rating)"
        
        ratingCollection.enumerated().forEach { index, star in
            let rating = Int(movie.rating)
            star.tintColor = rating > index ? .systemBlue : .lightGray
        }
    }
    
    @IBAction func pressRating(_ sender: UIButton) {
        guard let index = ratingCollection.firstIndex(of: sender), let movie = movie else {
            return
        }
        
        delegate?.didUpdateRatingForMovie(with: movie.id, newRating: index + 1)
    }
}

//
//  MoviesCollectionViewController.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 29.03.2021.
//

import UIKit

class MoviesCollectionViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let moviesDataSource: MoviesDataSource = MoviesFactory()
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        getMovies()
    }
    
    private func setupCollectionView() {
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func getMovies() {
        movies = moviesDataSource.getMovies()
        collectionView.reloadData()
    }
}

extension MoviesCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCellId", for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let movie = movies[indexPath.item % movies.count]
        cell.imageView.image = UIImage(named: movie.image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 2) - 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}

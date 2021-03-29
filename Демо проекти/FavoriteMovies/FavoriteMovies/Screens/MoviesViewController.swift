//
//  MoviesViewController.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 28.03.2021.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let moviesDataSource: MoviesDataSource = MoviesFactory()
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getMovies()
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .didEraseAllData, object: nil)
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getMovies() {
        movies = moviesDataSource.getMovies()
        tableView.reloadData()
    }
    
    private func setupNotifications() {
        NotificationCenter.default.addObserver(forName: .didEraseAllData, object: nil, queue: .main) { _ in
            self.movies.removeAll()
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movie = sender as? Movie, let destination = segue.destination as? MovieDetailsViewController else {
            return
        }
        
        destination.movie = movie
        destination.delegate = self
    }
}

// MARK: - Actions

private extension MoviesViewController {
    @IBAction func addNewMovie(_ sender: Any) {
        
    }
    
    @IBAction func showSettings() {
        guard let settingViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SettingsViewController") as? SettingsViewController else {
            return
        }
        
        settingViewController.delegate = self
        settingViewController.onEraseTap = {
            self.movies.removeAll()
            self.tableView.reloadData()
        }
        
        navigationController?.pushViewController(settingViewController, animated: true)
    }
}

// MARK: - UITableView protocols

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellID, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movies[indexPath.row]
        configure(cell, with: movie)
        
        return cell
    }
    
    private func configure(_ cell: MovieTableViewCell, with movie: Movie) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let dateString = dateFormatter.string(from: movie.releaseDate)
        print(dateString)
        
        cell.movieNameLabel.text = movie.name
        cell.movieImageView.image = UIImage(named: movie.image)
        cell.ratingLabel.text = "\(movie.rating)"
        
        cell.starsCollection.enumerated().forEach { index, star in
            let rating = Int(movie.rating)
            star.tintColor = rating > index ? .yellow : .lightGray
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        movies.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "ShowMovieDetails", sender: movie)
    }
}

// MARK: - MovieDetailsViewControllerDelegate

extension MoviesViewController: MovieDetailsViewControllerDelegate {
    func didUpdateRatingForMovie(with id: Int, newRating: Int) {
        guard let movieIndex = movies.firstIndex(where: { $0.id == id }) else {
            return
        }
        
        movies[movieIndex].rating = Double(newRating)
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - SettingsViewControllerDelegate

extension MoviesViewController: SettingsViewControllerDelegate {
    func didEraseAllData() {
        movies.removeAll()
        tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

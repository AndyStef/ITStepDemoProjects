//
//  MusicViewController.swift
//  NavigationExample
//
//  Created by Andriy Stefanchuk on 14.03.2021.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var musicDataService: MusicDataService = MusicFactory()
    private var musicTracks: [MusicTrack] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Music is loaded")
        setupTableView()
        updateDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Music appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Music will disappear")
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateDataSource() {
        musicTracks = musicDataService.getMusicTracks()
        tableView.reloadData()
    }
    
    private func showNoMusicAlert() {
        let alertController = UIAlertController(
            title: "We are sorry!",
            message: "Music is not implement yet",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "Okay :(", style: .default, handler: nil)
        let helpAction = UIAlertAction(title: "Help us to do it faster", style: .default, handler: { _ in
            // redirect to donation page
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(helpAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MusicViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicTracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MusicTrackTableViewCell.cellIdentifier,
                for: indexPath
        ) as? MusicTrackTableViewCell else {
            return UITableViewCell()
        }
        
        let musicTrack = musicTracks[indexPath.row]
        cell.nameLabel.text = "\(musicTrack.name) - \(musicTrack.author)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showNoMusicAlert()
    }
}

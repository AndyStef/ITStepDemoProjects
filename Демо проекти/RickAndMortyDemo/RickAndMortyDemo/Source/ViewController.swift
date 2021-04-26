//
//  ViewController.swift
//  RickAndMortyDemo
//
//  Created by Andy Stef on 05.11.2020.
//

import UIKit

class ViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
        
        return tableView
    }()
    
    private let networkManager = NetworkManager()
    private var dataSource = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        setupConstraints()
        
//        networkManager.getCharacters(species: "Alien") { characters in
//            self.dataSource = characters
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
//        networkManager.baseGetCharactersRequest { characters in
//            self.dataSource = characters
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        networkManager.baseGetCharactersRequest(species: "Alien") { characters in
            self.dataSource = characters

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
//        networkManager.makeRequest(path: .character, parameters: [:], callback: handleCharactersResultResponse)
        
//        networkManager.alamofireGetCharacters(parameters: ["species": "Alien"]) { characters in
//            self.dataSource = characters
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
    }
    
    private func handleCharactersResultResponse(_ results: CharactersResults) {
        self.dataSource = results.results
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterCell.identifier, for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        
        let char = dataSource[indexPath.row]
        cell.nameLabel.text = char.name
        cell.imageUrl = char.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}

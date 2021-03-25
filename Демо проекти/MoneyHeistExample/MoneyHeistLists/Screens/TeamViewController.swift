//
//  TeamViewController.swift
//  NavigationExample
//
//  Created by Andy Stef on 14.03.2021.
//

import UIKit

class TeamViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var teamMembersService: TeamDataService = TeamFactory()
    private var teamMembers: [TeamMember] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Team is loaded")
        setupTableView()
        updateDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Team appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Team will disappear")
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func updateDataSource() {
        teamMembers = teamMembersService.getTeamMembers()
        tableView.reloadData()
    }
    
    private func showTeamMemberDetails(at index: Int) {
        let character = teamMembers[index]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
        controller.character = character
        
        present(controller, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TeamMemberTableViewCell.cellIdentifier,
                for: indexPath
        ) as? TeamMemberTableViewCell else {
            return UITableViewCell()
        }
        
        let member = teamMembers[indexPath.row]
        cell.nameLabel.text = member.name
        cell.teamMemberImageView.image = UIImage(named: member.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTeamMemberDetails(at: indexPath.row)
    }
}

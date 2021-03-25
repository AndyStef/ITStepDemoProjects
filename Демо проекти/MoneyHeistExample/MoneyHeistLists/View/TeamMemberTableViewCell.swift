//
//  TeamMemberTableViewCell.swift
//  NavigationExample
//
//  Created by Andy Stef on 14.03.2021.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "TeamMemberTableViewCell"
    
    @IBOutlet weak var teamMemberImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupContainerStyle()
    }
    
    private func setupContainerStyle() {
        containerView.layer.cornerRadius = 16.0
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 4.0
    }
}

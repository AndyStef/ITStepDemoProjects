//
//  MusicTrackTableViewCell.swift
//  NavigationExample
//
//  Created by Andriy Stefanchuk on 15.03.2021.
//

import UIKit

class MusicTrackTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "MusicTrackTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupContainerStyle()
    }
    
    private func setupContainerStyle() {
        containerView.layer.cornerRadius = 0.0        
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 4.0
    }
}

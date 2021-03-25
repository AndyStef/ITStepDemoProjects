//
//  CharacterViewController.swift
//  NavigationExample
//
//  Created by Andy Stef on 15.03.2021.
//

import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var deadImageView: UIImageView!
    @IBOutlet weak var grayOverlay: UIView!
    
    var character: TeamMember?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerStyle()
        setupUI()
    }
    
    private func setupContainerStyle() {
        containerView.layer.cornerRadius = 16.0
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1.0
        containerView.layer.shadowOffset = .init(width: 0.0, height: 8.0)
        containerView.layer.shadowRadius = 8.0
    }
    
    private func setupUI() {
        guard let character = character else {
            return
        }
        
        nameLabel.text = character.name
        imageView.image = UIImage(named: character.image)
        descriptionLabel.text = character.description
        
        if !character.isAlive {
            deadImageView.isHidden = false
            grayOverlay.isHidden = false
        }
    }
}

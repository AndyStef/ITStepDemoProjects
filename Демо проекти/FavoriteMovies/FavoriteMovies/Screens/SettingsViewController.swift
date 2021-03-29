//
//  SettingsViewController.swift
//  FavoriteMovies
//
//  Created by Andy Stef on 29.03.2021.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func didEraseAllData()
}

class SettingsViewController: UIViewController {
    
    var onEraseTap: (() -> Void)?
    weak var delegate: SettingsViewControllerDelegate?
    
    @IBOutlet weak var eraseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        eraseButton.layer.cornerRadius = 25.0
    }
    
    @IBAction func clearAllData() {
        onEraseTap?()
        NotificationCenter.default.post(name: .didEraseAllData, object: nil)
        delegate?.didEraseAllData()
    }
}

extension Notification.Name {
    static var didEraseAllData = Notification.Name(rawValue: "DidEraseAllData")
}

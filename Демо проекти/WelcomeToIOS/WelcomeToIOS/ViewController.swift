//
//  ViewController.swift
//  WelcomeToIOS
//
//  Created by Andy Stef on 04.02.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var greetingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("First screen appeared")
        greetingsLabel.text = ""
    }
    
    @IBAction func sayMyName(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty {
            greetingsLabel.text = "Greetings, \(name)!"
        } else {
            print("No name")
        }
    }
}

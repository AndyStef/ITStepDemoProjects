//
//  ViewController.swift
//  BasicNavigationExample
//
//  Created by Andy Stef on 15.03.2021.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 1 loaded")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Screen 1 appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Screen 1 disappeared")
    }

}


class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 2 loaded")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Screen 2 appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Screen 2 disappeared")
    }
}



class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 3 loaded")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Screen 3 appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Screen 3 disappeared")
    }
}



class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 4 loaded")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Screen 4 appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Screen 4 disappeared")
    }
}



class ViewController5: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Screen 4 loaded")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Screen 4 appeared")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("Screen 4 disappeared")
    }
    
    @IBAction func showSecondController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController6") as! ViewController6
        viewController.receivedName = textField.text

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "Test alert", message: "Test description text", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "Okay", style: .default) { _ in
            print("Okay action")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            print("Cancel")
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            print("Delete")
        }
        
        let deleteAction2 = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            print("Delete2")
        }
        
        alertController.addAction(deleteAction)
        alertController.addAction(okAction)
        alertController.addAction(deleteAction2)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController6 {
            destination.receivedName = textField.text
        }
    }
}

class ViewController6: UIViewController {
    
    var receivedName: String?
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let receivedName = receivedName {
            textLabel.text = "Hello, \(receivedName)"
        }
    }
}

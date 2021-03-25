//
//  TableViewController.swift
//  NavigationExample
//
//  Created by Andy Stef on 22.03.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var someNumber = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        var testInt = 10
//        testInt.square()
//        testInt.square()
//        testInt.square()
//
//
//        testInt.squared
    }
    
    // animations
    // database
    // networking
}

// 1. Group functions by their type
// 2. Protocol conformance
// 3. Extend Swift standart types

extension Int {
    var squared: Int {
        self * self
    }
    
    mutating func square() {
        self = self * self
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as? CustomTableViewCell else {
            print("no cell found")
            return UITableViewCell()
        }
        
        cell.titleLabel.text = "\(indexPath.row)"
        
        return cell
    }
}

// animations

extension TableViewController {
    
}

// database

extension TableViewController {
    
}

// networking

extension TableViewController {
    
}

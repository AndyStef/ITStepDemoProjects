//
//  ViewController.swift
//  Child mood
//
//  Created by Andy Stef on 08.02.2021.
//

import UIKit

class ViewController: UIViewController {

    let lightSideMoodImages = [
        "Happy",
        "Eating",
        "Drinking",
        "Excited"
    ]
    
    let darkSideMoodImages = [
        "Angry",
        "Stealing",
        "Fighting",
        "Fat"
    ]
    
    var isOnLightSide = true
    
    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var moodSegmentedControl: UISegmentedControl!
    
    @IBAction func moodChanged(_ sender: UISegmentedControl) {
        let currentIndex = sender.selectedSegmentIndex
        let image = isOnLightSide ? lightSideMoodImages[currentIndex] : darkSideMoodImages[currentIndex]
        childImageView.image = UIImage(named: image)
    }
    
    @IBAction func changeSide(_ sender: UISwitch) {
        isOnLightSide = !sender.isOn
        
        switch isOnLightSide {
        case true:
            for (index, imageName) in lightSideMoodImages.enumerated() {
                moodSegmentedControl.setTitle(imageName, forSegmentAt: index)
            }
            
        case false:
            for (index, imageName) in darkSideMoodImages.enumerated() {
                moodSegmentedControl.setTitle(imageName, forSegmentAt: index)
            }
            
        }
        
        let currentIndex = moodSegmentedControl.selectedSegmentIndex
        let image = isOnLightSide ? lightSideMoodImages[currentIndex] : darkSideMoodImages[currentIndex]
        childImageView.image = UIImage(named: image)
    }
}

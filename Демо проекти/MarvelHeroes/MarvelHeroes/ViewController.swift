//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Andy Stef on 18.02.2021.
//

import UIKit

// Design tools
// 1. animations, transitions
// 2. Icons, images
// 3. colors
// 4. fonts
// 5. shadows
// 6. corner radius
// 7. blur
// 8. gradient
// 9. borders

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var teamImageView: UIImageView!
    
    var heroes: [Hero] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        getHeroes()
        setupInitialHero()
    }
    
    func setupUI() {
        setupContainerCorners()
        setupContainerShadow()
        setupHeroImageView()
    }
    
    func setupContainerCorners() {
        containerView.layer.cornerRadius = 16.0
    }
    
    func setupContainerShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 24
    }
    
    func setupHeroImageView() {
        heroImageView.layer.cornerRadius = 24.0
        heroImageView.layer.borderColor = UIColor.white.cgColor
        heroImageView.layer.borderWidth = 1.0
        heroImageView.layer.masksToBounds = true
    }
    
    func setupInitialHero() {
        guard heroes.count > 0 else {
            return
        }
        
        setupUI(with: heroes[0])
    }
    
    func getHeroes() {
        heroes = HeroAcademy.generateHeroes().sorted(by: { $0.power < $1.power })
    }
    
    func setupUI(with hero: Hero) {
        heroImageView.image = UIImage(named: hero.image)
        heroNameLabel.text = hero.name
        teamImageView.image = hero.team.image
        containerView.backgroundColor = hero.team.color
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        for hero in heroes {
            if currentValue > hero.power {
                setupUI(with: hero)
            }
        }
    }
}

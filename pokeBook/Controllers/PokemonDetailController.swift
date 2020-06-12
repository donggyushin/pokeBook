//
//  PokemonDetailController.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/12.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonDetailController:UIViewController {
    
    // MARK: Properties
    var pokemon:Pokemon? {
        didSet {
            configurePokemon()
        }
    }
    
    lazy var imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var weightLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "WEIGHT"
        return label
    }()
    
    lazy var weightValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderWeight:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var heightLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "HEIGHT"
        return label
    }()
    
    lazy var heightValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderHeight:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var defenseLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "DEFENSE"
        return label
    }()
    
    lazy var defenseValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderDefense:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var attackLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "ATTACK"
        return label
    }()
    
    lazy var attackValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderAttack:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: Helpers
    
    func configurePokemon(){
        guard let pokemon = self.pokemon else { return }
        print(pokemon)
        self.title = pokemon.name?.uppercased()
        self.descriptionLabel.text = pokemon.description
        if let weight = pokemon.weight {
            self.weightValueLabel.text = String(weight)
        }
        
        if let height = pokemon.height {
            self.heightValueLabel.text = String(height)
        }
        
        if let defense = pokemon.defense {
            self.defenseValueLabel.text = String(defense)
        }
        
        if let attack = pokemon.attack {
            self.attackValueLabel.text = String(attack)
        }
        
        if let urlString = pokemon.imageUrl {
            if let url = URL(string: urlString) {
                self.imageView.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
    // MARK: Configures
    func configure(){
        
        
        
        configureViewComponents()
    }
    
    func configureViewComponents(){
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(weightValueLabel)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        weightValueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightValueLabel.leftAnchor.constraint(equalTo: weightLabel.rightAnchor,constant: 15).isActive = true
        
        view.addSubview(lineUnderWeight)
        lineUnderWeight.translatesAutoresizingMaskIntoConstraints = false
        lineUnderWeight.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 15).isActive = true
        lineUnderWeight.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lineUnderWeight.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        lineUnderWeight.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: lineUnderWeight.bottomAnchor, constant: 15).isActive = true
        heightLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: lineUnderWeight.bottomAnchor, constant: 15).isActive = true
        heightValueLabel.leftAnchor.constraint(equalTo: heightLabel.rightAnchor, constant: 15).isActive = true
        
        view.addSubview(lineUnderHeight)
        lineUnderHeight.translatesAutoresizingMaskIntoConstraints = false
        lineUnderHeight.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 15).isActive = true
        lineUnderHeight.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lineUnderHeight.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        lineUnderHeight.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(defenseLabel)
        defenseLabel.translatesAutoresizingMaskIntoConstraints = false
        defenseLabel.topAnchor.constraint(equalTo: lineUnderHeight.bottomAnchor, constant: 15).isActive = true
        defenseLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(defenseValueLabel)
        defenseValueLabel.translatesAutoresizingMaskIntoConstraints = false
        defenseValueLabel.topAnchor.constraint(equalTo: lineUnderHeight.bottomAnchor, constant: 15).isActive = true
        defenseValueLabel.leftAnchor.constraint(equalTo: defenseLabel.rightAnchor, constant: 15).isActive = true
        
        view.addSubview(lineUnderDefense)
        lineUnderDefense.translatesAutoresizingMaskIntoConstraints = false
        lineUnderDefense.topAnchor.constraint(equalTo: defenseLabel.bottomAnchor, constant: 15).isActive = true
        lineUnderDefense.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lineUnderDefense.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        lineUnderDefense.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(attackLabel)
        attackLabel.translatesAutoresizingMaskIntoConstraints = false
        attackLabel.topAnchor.constraint(equalTo: lineUnderDefense.bottomAnchor, constant: 15).isActive = true
        attackLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        
        view.addSubview(attackValueLabel)
        attackValueLabel.translatesAutoresizingMaskIntoConstraints = false
        attackValueLabel.topAnchor.constraint(equalTo: lineUnderDefense.bottomAnchor, constant: 15).isActive = true
        attackValueLabel.leftAnchor.constraint(equalTo: attackLabel.rightAnchor, constant: 15).isActive = true
        
        view.addSubview(lineUnderAttack)
        lineUnderAttack.translatesAutoresizingMaskIntoConstraints = false
        lineUnderAttack.topAnchor.constraint(equalTo: attackLabel.bottomAnchor, constant: 15).isActive = true
        lineUnderAttack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        lineUnderAttack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        lineUnderAttack.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: lineUnderAttack.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        
    }
}

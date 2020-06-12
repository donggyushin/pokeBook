//
//  InfoView.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/09.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import UIKit
import SDWebImage

protocol  InfoViewProtocol {
    func removeInfoView(pokemon:Pokemon)
}

class InfoView:UIView {
    
    // MARK: Properties
    
    var delegate:InfoViewProtocol?
    
    var pokemon:Pokemon? {
        didSet {
            configurePokemon()
        }
    }
    
    lazy var nameView:UIView = {
        let view = UIView()
        view.backgroundColor = .mainColor
        view.addSubview(self.nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        return view
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var imageView:UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var line:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
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
    
    lazy var lineUnderHeightLabel:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var typeLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "TYPE"
        return label
    }()
    
    lazy var typeValueLabel:UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var lineUnderTypeLabel:UIView = {
        let view = UIView()
        view.backgroundColor = .tertiarySystemGroupedBackground
        return view
    }()
    
    lazy var goToDetailButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("상세보기", for: UIControl.State.normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .mainColor
        button.addTarget(self, action: #selector(detailButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    
    // MARK: Selectors
    @objc func detailButtonTapped() {
        guard let pokemon = self.pokemon else { return }
        self.delegate?.removeInfoView(pokemon: pokemon)
    }
    
    // MARK: Helpers
    
    func configurePokemon(){
        guard let pokemon = self.pokemon else { return }
        if let urlString = pokemon.imageUrl {
            if let url = URL(string: urlString) {
                self.imageView.sd_setImage(with: url, completed: nil)
            }
        }
        
        self.nameLabel.text = pokemon.name
        self.typeValueLabel.text = pokemon.type
        if let weight = pokemon.weight {
            self.weightValueLabel.text = String(weight)
        }
        
        if let height = pokemon.height {
            self.heightValueLabel.text = String(height)
        }
    }
    
    func adjustColors(){
        if self.traitCollection.userInterfaceStyle == .dark {
            // 어두운 테마일때
            self.goToDetailButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        }else {
            // 밝은 테마일때
            self.goToDetailButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        }
    }
    
    
    func configureViewComponents(){
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.nameView.bottomAnchor, constant: 15).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        self.addSubview(weightValueLabel)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        weightValueLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50).isActive = true
        weightValueLabel.leftAnchor.constraint(equalTo: weightLabel.rightAnchor, constant: 10).isActive = true
        
        self.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 5).isActive = true
        line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        self.addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 20).isActive = true
        heightValueLabel.leftAnchor.constraint(equalTo: heightLabel.rightAnchor, constant: 10).isActive = true
        
        
        self.addSubview(lineUnderHeightLabel)
        lineUnderHeightLabel.translatesAutoresizingMaskIntoConstraints = false
        lineUnderHeightLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 5).isActive = true
        lineUnderHeightLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        lineUnderHeightLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        lineUnderHeightLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        self.addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        self.addSubview(typeValueLabel)
        typeValueLabel.translatesAutoresizingMaskIntoConstraints = false
        typeValueLabel.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 20).isActive = true
        typeValueLabel.leftAnchor.constraint(equalTo: typeLabel.rightAnchor, constant: 10).isActive = true
        
        self.addSubview(lineUnderTypeLabel)
        lineUnderTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        lineUnderTypeLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5).isActive = true
        lineUnderTypeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        lineUnderTypeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        lineUnderTypeLabel.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        self.addSubview(goToDetailButton)
        goToDetailButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        goToDetailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        goToDetailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        goToDetailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        adjustColors()
    }
}

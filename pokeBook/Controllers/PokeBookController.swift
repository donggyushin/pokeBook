//
//  PokeBookController.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/02.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import UIKit

let reuseableIdentifier = "pokeBookCell"

class PokeBookController:UICollectionViewController {
    // MARK: Properties
    let pokemonService = PokemonService()
    var pokemons = [Pokemon]()
    
    lazy var infoView:InfoView = {
        let view = InfoView()
        return view
    }()
    
    lazy var blurView:UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        return blurEffectView
    }()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponents()
    }
    
    // MARK: override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        adjustColors()
    }
    
    // MARK: Selectors
    @objc func searchButtonTapped(){
        print("search button tapped")
    }
    
    @objc func blurviewTapped(){
        removeInfoViewAnimation()
    }
    
    // MARK: Helper Functions
    
    func removeInfoViewAnimation(){
        UIView.animate(withDuration: 0.3, animations: {
            self.blurView.alpha = 0
            self.infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.infoView.alpha = 0
        }) { (bool) in
            self.infoView.removeFromSuperview()
        }
    }
    
    
    func adjustColors(){
        if self.traitCollection.userInterfaceStyle == .dark {
            // 다크 모드일 때
            navigationController?.navigationBar.tintColor = .white
        }else {
            
            navigationController?.navigationBar.tintColor = .black
            
        }
    }
    
    func configureViewComponents(){
        collectionView.backgroundColor = .systemBackground
        navigationController?.navigationBar.barTintColor = UIColor.mainColor
        navigationController?.navigationBar.isTranslucent = false
        
        self.title = "포켓몬도감"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self, action: #selector(searchButtonTapped))
        adjustColors()
        pokemonService.delegate = self
        collectionView.register(PokemonCell.self, forCellWithReuseIdentifier: reuseableIdentifier)
        self.pokemonService.fetchPokemons()
        
        self.collectionView.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        blurView.alpha = 0
        
        let blurviewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(blurviewTapped))
        blurView.addGestureRecognizer(blurviewTapGestureRecognizer)
        
    }
    
}


extension PokeBookController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! PokemonCell
        cell.pokemon = self.pokemons[indexPath.row]
        cell.delegate = self
        return cell
    }
}


extension PokeBookController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 36) / 3
        let size = CGSize(width: width, height: width)
        return size
    }
}



extension PokeBookController:PokemonServiceProtocol {
    func pokemonService(pokemons: [Pokemon]) {
        self.pokemons = pokemons
        self.collectionView.reloadData()
    }
    
    
}


extension PokeBookController:PokemonCellProtocol {
    func showInfoView(pokemon: Pokemon) {
        collectionView.addSubview(infoView)
        infoView.delegate = self
        infoView.translatesAutoresizingMaskIntoConstraints = false
        infoView.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor, constant: 0).isActive = true
        infoView.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor, constant: -55).isActive = true
        infoView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        infoView.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        infoView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        infoView.alpha = 0
        infoView.pokemon = pokemon
        
        UIView.animate(withDuration: 0.3) {
            self.blurView.alpha = 1
            self.infoView.transform = .identity
            self.infoView.alpha = 1
        }
    }
}

extension PokeBookController:InfoViewProtocol {
    func removeInfoView() {
        removeInfoViewAnimation()
    }
    
    
}

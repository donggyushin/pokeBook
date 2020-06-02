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
    
    // MARK: Helper Functions
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
        
    }
    
}


extension PokeBookController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableIdentifier, for: indexPath) as! PokemonCell
        cell.pokemon = self.pokemons[indexPath.row]
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

//
//  PokemonService.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/02.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import Foundation

protocol PokemonServiceProtocol {
    func pokemonService(pokemons:[Pokemon])
}

class PokemonService {
    let base_url = "https://pokemon.treduler.pro/"
    var delegate:PokemonServiceProtocol?
    
    func fetchPokemons(){
        if let url = URL(string: base_url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error occured when fetching pokemon datas. [LOG]:", error.localizedDescription)
                    return
                }else {
                    if let data = data {
                        do {
                            let res = try JSONDecoder().decode([Pokemon].self, from: data)
                            DispatchQueue.main.async {
                                self.delegate?.pokemonService(pokemons: res)
                            }
                            
                        }catch let error {
                            print("Error occured when decoding json data. [LOG]: ", error.localizedDescription)
                        }
                    }
                }
            }.resume()
        }
    }
}

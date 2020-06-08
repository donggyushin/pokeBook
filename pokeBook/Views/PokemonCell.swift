//
//  PokemonCell.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/02.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import UIKit
import SDWebImage

class PokemonCell:UICollectionViewCell {
    // MARK: Properties
    var pokemon:Pokemon? {
        didSet {
            guard self.pokemon != nil else { return }
            label.text = pokemon?.name
            guard self.pokemon?.imageUrl != nil else { return }
            if let url = URL(string: self.pokemon!.imageUrl!) {
                self.imageView.sd_setImage(with: url, completed: nil)
            }
            
        }
    }
    
    lazy var imageView:UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = UIColor.tertiarySystemGroupedBackground
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var textView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainColor
        view.addSubview(self.label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }()
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Selectors
    @objc func longPressed(sender: UILongPressGestureRecognizer){
        if sender.state == UIGestureRecognizer.State.began {
            print("Tapped started")
        }
    }
    
    // MARK: Helper functions
    func configureViewComponents(){
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
        self.addGestureRecognizer(longPressRecognizer)
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        self.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0).isActive = true
        textView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        textView.rightAnchor.constraint(equalToSystemSpacingAfter: self.rightAnchor, multiplier: 0).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}

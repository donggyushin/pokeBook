//
//  InfoView.swift
//  pokeBook
//
//  Created by 신동규 on 2020/06/09.
//  Copyright © 2020 Mac circle. All rights reserved.
//

import UIKit

class InfoView:UIView {
    
    // MARK: Properties
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
        label.text = "Name"
        return label
    }()
    
    lazy var goToDetailButton:UIButton = {
        let button = UIButton(type: UIButton.ButtonType.system)
        button.setTitle("상세보기", for: UIControl.State.normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .mainColor
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
    
    // MARK: Helpers
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
        self.backgroundColor = .tertiarySystemGroupedBackground
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.addSubview(nameView)
        nameView.translatesAutoresizingMaskIntoConstraints = false
        nameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        nameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        self.addSubview(goToDetailButton)
        goToDetailButton.translatesAutoresizingMaskIntoConstraints = false
        goToDetailButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        goToDetailButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        goToDetailButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        goToDetailButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        adjustColors()
    }
}

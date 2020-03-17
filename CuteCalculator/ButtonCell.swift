//
//  ButtonCell.swift
//  CuteCalculator
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 Kingsley. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    let roundView = UIView()
    
    fileprivate func setupConstraints() {
        contentView.addSubview(roundView)
        roundView.addSubview(titleLabel)
            
        roundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        roundView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        roundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        roundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
        titleLabel.centerXAnchor.constraint(equalTo: roundView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: roundView.centerYAnchor).isActive = true
    }
    
    fileprivate func setupView() {
        backgroundColor = .black
        
        roundView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

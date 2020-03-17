//
//  CalculatorViewController.swift
//  CuteCalculator
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 Kingsley. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    let buttonCellID = "buttonCellID"
    let buttonFunctions = ["AC", "+/-", "%", "÷", "7", "8", "9", "×", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]
    var displayView = UIView()
    var displayLabel = UILabel()
    var collectionView: UICollectionView!
    
    fileprivate func setupDisplayView() {
        displayLabel.textColor = .white
        displayLabel.textAlignment = .right
        displayLabel.numberOfLines = 1
        displayLabel.text = ""
        displayLabel.font = UIFont.systemFont(ofSize: 80.0)
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        displayView.backgroundColor = .black
        displayView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(displayView)
        displayView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        displayView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        displayView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        displayView.heightAnchor.constraint(equalToConstant: view.frame.height/3).isActive = true
        
        displayView.addSubview(displayLabel)
        displayLabel.rightAnchor.constraint(equalTo: displayView.rightAnchor, constant: -30).isActive = true
        displayLabel.bottomAnchor.constraint(equalTo: displayView.bottomAnchor, constant: -20).isActive = true
    }
    
    fileprivate func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: buttonCellID)
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: displayView.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDisplayView()
        setupCollectionView()
    }
}

extension CalculatorViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonCellID, for: indexPath) as! ButtonCell
        if indexPath.row % 4 == 3 || indexPath.row == 18 {
            cell.roundView.backgroundColor = .orange
        } else if indexPath.row < 3 {
            cell.roundView.backgroundColor = .lightGray
            cell.titleLabel.textColor = .black
        } else {
            cell.roundView.backgroundColor = .darkGray
        }
        cell.titleLabel.text = buttonFunctions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 4 == 3 || indexPath.row < 3 {
            displayLabel.text = ""
        } else if indexPath.row == 18 {
            displayLabel.text = "ur cute"
        } else {
            let cell = collectionView.cellForItem(at: indexPath) as! ButtonCell
            displayLabel.text! += cell.titleLabel.text ?? ""
        }
    }
}

extension CalculatorViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        if indexPath.row == 16 {
            return CGSize(width: width/2, height: width/4)
        } else {
            return CGSize(width: width/4, height: width/4)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

//
//  CalculatorViewController.swift
//  CuteCalculator
//
//  Created by admin on 3/16/20.
//  Copyright © 2020 Kingsley. All rights reserved.
//

import UIKit

class CalculatorViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let displayHeaderViewID = "displayHeaderViewId"
    let buttonCellID = "buttonCellID"
    let buttonFunctions = ["AC", "+/-", "%", "÷", "7", "8", "9", "×", "4", "5", "6", "-", "1", "2", "3", "+", "0", ".", "="]

    fileprivate func registerCells() {
        // Do any additional setup after loading the view.
        collectionView.register(DisplayHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: displayHeaderViewID)
        collectionView.register(ButtonCell.self, forCellWithReuseIdentifier: buttonCellID)
    }
    
    fileprivate func setupView() {
        view.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setupView()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 19
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: buttonCellID, for: indexPath) as! ButtonCell
        cell.titleLabel.text = buttonFunctions[indexPath.row]
        if indexPath.row % 4 == 3 || indexPath.row == 18 {
            cell.roundView.backgroundColor = .orange
        } else if indexPath.row < 3 {
            cell.roundView.backgroundColor = .lightGray
            cell.titleLabel.textColor = .black
        } else {
            cell.roundView.backgroundColor = .darkGray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        if indexPath.row == 16 {
            return CGSize(width: width/2, height: width/4)
        } else {
            return CGSize(width: width/4, height: width/4)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        return CGSize(width: width, height: height - width * 1.25)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: displayHeaderViewID, for: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


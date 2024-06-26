//
//  HeaderCollectionViewCell.swift
//  UICollectionViewNetflix
//
//  Created by Chayakan Tangsanga on 19/3/2567 BE.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    func setTitle(name: String) {
        titleLabel.text = name
    }
}

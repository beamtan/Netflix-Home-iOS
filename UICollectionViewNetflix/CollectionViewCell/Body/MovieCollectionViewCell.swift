//
//  MovieCollectionViewCell.swift
//  UICollectionViewNetflix
//
//  Created by Chayakan Tangsanga on 19/3/2567 BE.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var imageView: UIImageView!
    
    func setup(image: UIImage) {
        imageView.image = image
    }
}

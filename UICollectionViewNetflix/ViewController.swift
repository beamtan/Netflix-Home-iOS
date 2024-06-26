//
//  ViewController.swift
//  UICollectionViewNetflix
//
//  Created by Chayakan Tangsanga on 19/3/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images: [UIImage] = Array(1...22).map { UIImage(named: String($0))! }
    private enum MovieCategory: CaseIterable {
        case action
        case anime
        case children
        case classic
        case comedies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let logo = UIImage(named: "netflix") {
            let imageView = UIImageView(image: logo)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 0, y: 0, width: 80, height: 20)
            navigationItem.titleView = imageView
        }
        
        collectionView.register(UINib(nibName: "HeaderCollectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionViewCell")
        collectionView.collectionViewLayout = createLayout()
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            let item = CompositionLayoutHelper.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 3)
            let group = CompositionLayoutHelper.createGroup(alignment: .horizontal, width: .fractionalWidth(0.3), height: .fractionalHeight(0.27), items: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .paging
            
            // Header
            
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(30))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            
            section.boundarySupplementaryItems = [header]
            
            return section
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionViewCell", for: indexPath) as! MovieCollectionViewCell
        let image = images[Int.random(in: 1...21)]
        cell.setup(image: image)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return MovieCategory.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            header.setTitle(name: " \(MovieCategory.allCases[indexPath.section])".capitalized)
            return header
        } else {
            return UICollectionReusableView()
        }
    }
}

//
//  SnappingViewController.swift
//  Custom Flow Layout Test
//
//  Created by Juan Gerardo Cruz on 12/23/19.
//  Copyright © 2019 Juan Gerardo Cruz. All rights reserved.
//

import UIKit

class SnappingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.register(SnappingCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.collectionViewLayout = SnappingFlowLayout()
    }
}

extension SnappingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SnappingCollectionViewCell
        
        cell.imageView.image = UIImage(named: "image\(indexPath.row+1)")
        return cell
    }
}

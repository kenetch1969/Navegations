//
//  CarouselViewController.swift
//  Custom Flow Layout Test
//
//  Created by Juan Gerardo Cruz on 12/23/19.
//  Copyright © 2019 Juan Gerardo Cruz. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var cellIdentifier = "cell"
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Carousel"
                
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]

        searchController.searchBar.tintColor = UIColor.white
              UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "Dismiss"
        
//        let searchBarTextAttributes: [NSAttributedString.Key : AnyObject] = [NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)]
//
//        searchController.searchBar.searchTextField.defaultTextAttributes = searchBarTextAttributes
        

        
        searchController.searchBar.searchTextField.backgroundColor = .white
        //searchController.searchBar.tintColor = UIColor.orange


//        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
//            if let backgroundview = textfield.subviews.first {
//                backgroundview.backgroundColor = UIColor.white
//                backgroundview.layer.cornerRadius = 10
//                backgroundview.clipsToBounds = true
//            }
//        }
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
                
//        //let item = searchController.searchBar.searchTextField
//        let searchBarTextAttributes: [NSAttributedString.Key : AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): UIColor.red, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.systemFont(ofSize: 25.0)]
//
//        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes
        
      
        
        collectionView.dataSource = self
        collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.collectionViewLayout = CarouselFlowLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.orange,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0)])
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CarouselCollectionViewCell
        
        cell.imageView.image = UIImage(named: "image\(indexPath.row+1)")
        return cell
    }
}

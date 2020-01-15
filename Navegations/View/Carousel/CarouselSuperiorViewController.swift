//
//  CarouselViewController.swift
//  Custom Flow Layout Test
//
//  Created by Juan Gerardo Cruz on 12/23/19.
//  Copyright © 2019 Juan Gerardo Cruz. All rights reserved.
//  Animacion ejemplos https://www.smashingmagazine.com/2019/11/performing-ios-animations-views-uikit-uiview/

import UIKit

class CarouselSuperiorViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var cellIdentifier = "cell"
    private let imageView = UIImageView()
    private var buttonAnimate = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
    collectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.collectionViewLayout = CarouselFlowLayout()
        
        setImageView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setButtonAnimate()
    }
    
    private func setButtonAnimate() {
      UIView.animate(withDuration: 2.0) { //1
        self.buttonAnimate = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        self.buttonAnimate.setTitle("Ok", for: .normal)
        self.buttonAnimate.setTitleColor(.black, for: .normal)
        self.buttonAnimate.backgroundColor = .green
        self.view.addSubview(self.buttonAnimate)
        let guide = self.view.safeAreaLayoutGuide
        self.buttonAnimate.translatesAutoresizingMaskIntoConstraints = false
        self.buttonAnimate.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        self.buttonAnimate.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10).isActive = true
        self.buttonAnimate.heightAnchor.constraint(equalToConstant: 64).isActive = true
        self.buttonAnimate.widthAnchor.constraint(equalToConstant: 64).isActive = true
      }
    }
    
    
    private func setImageView() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Caramel")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        var panGesture  = UIPanGestureRecognizer()
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(panGesture)
    }
    
    @IBAction func panGestureHandler(_ recognizer: UIPanGestureRecognizer){
        self.view.bringSubviewToFront(imageView)
        let translation = recognizer.translation(in: self.view)
        imageView.center = CGPoint(x: imageView.center.x + translation.x, y: imageView.center.y + translation.y)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
    
}

extension CarouselSuperiorViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CarouselCollectionViewCell
        
        cell.imageView.image = UIImage(named: "image\(indexPath.row+1)")
        return cell
    }
}

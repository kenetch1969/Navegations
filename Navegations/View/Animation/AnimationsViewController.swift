//
//  AnimationsViewController.swift
//  Navegations
//
//  Created by Juan Gerardo Cruz on 12/23/19.
//  Copyright © 2019 Juan Gerardo Cruz. All rights reserved.
//Drag and drop uicollection
//http://www.sonducngo.com/blog/2014/2/12/drag-and-drop-between-uicollectionviews
//https://ktrkathir.wordpress.com/2018/08/30/drag-delegate-and-drop-delegate-on-ios-11-0/

import UIKit

class AnimationsViewController: UIViewController {
    @IBOutlet weak var animationSegmentControl: UISegmentedControl!
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.animationSegmentControl.selectedSegmentIndex = -1
    }
    
    @IBAction func animationSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            animationZero()
            break
        case 1:
            animationOne()
            break
        case 2:
            animationSecond()
            break
        case 3:
            animationThird()
            break
        default:
            break
        }
    }
    
    private func animationZero() {
        print(self.view.center)
        print("x: \(self.view.frame.width) , y: \(self.view.frame.height) ")
        print("x: \(self.view.frame.width/2) , y: \(self.view.frame.height/2) ")
        let newButtonWidth: CGFloat = 60
        UIView.animate(withDuration: 2.0) { //1
            self.button.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth) //2
            self.button.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2) //3
        }
        
    }
    
    private func animationOne() {
    let newButtonWidth: CGFloat = 60
        UIView.animate(withDuration: 1.0, //1
            delay: 0.0, //2
            usingSpringWithDamping: 0.3, //3
            initialSpringVelocity: 1, //4
            options: UIView.AnimationOptions.curveEaseInOut, //5
            animations: ({ //6
                self.button.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
                self.button.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2) //3
        }), completion: nil)
    }
    
    private func animationSecond() {
        let newButtonWidth: CGFloat = 60
        let animator = UIViewPropertyAnimator(duration:0.3, curve: .linear) { //1
            self.button.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
            self.button.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2) //3
        }
        animator.startAnimation() //2
    }
    
    private func animationThird() {
        let start = CGPoint(x: button.frame.minX, y: button.frame.minY)
        
        UIView.animateKeyframes(withDuration: 5, //1
          delay: 0, //2
          options: .calculationModeLinear, //3
          animations: { //4
            UIView.addKeyframe( //5
              withRelativeStartTime: 0.25, //6
              relativeDuration: 0.25) { //7
                self.button.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY) //8
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.button.center = CGPoint(x: self.view.bounds.width, y: start.y)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.button.center = start
            }
        })
    }
    
    private func setButtonAnimate() {
      UIView.animate(withDuration: 2.0) { //1
        let buttonAnimate = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        buttonAnimate.setTitle("Ok", for: .normal)
        buttonAnimate.setTitleColor(.black, for: .normal)
        buttonAnimate.backgroundColor = .green
        self.view.addSubview(buttonAnimate)
        let guide = self.view.safeAreaLayoutGuide
        buttonAnimate.translatesAutoresizingMaskIntoConstraints = false
        buttonAnimate.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
        buttonAnimate.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -10).isActive = true
        buttonAnimate.heightAnchor.constraint(equalToConstant: 64).isActive = true
        buttonAnimate.widthAnchor.constraint(equalToConstant: 64).isActive = true
      }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

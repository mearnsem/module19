//
//  ViewController.swift
//  Animations
//
//  Created by Justin Smith on 6/8/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerImageView: CustomImageView!
    @IBOutlet weak var imageViewHolderView: CustomView!
    @IBOutlet weak var firstLastLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    var nextPlayerButton: CustomButton!
    var previousPlayerButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNextPlayerButton()
        createPreviousPlayerButton()
    }
    
    func createNextPlayerButton() {
        nextPlayerButton = CustomButton(frame: CGRectMake(0, self.view.frame.height - 43, self.view.frame.width, 35))
        nextPlayerButton.backgroundColor = .orangeColor()
        nextPlayerButton.setTitle("Next Player", forState: .Normal)
        nextPlayerButton.addTarget(self, action: #selector(nextPlayerButtonTapped(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(nextPlayerButton)
    }
    
    func createPreviousPlayerButton() {
        previousPlayerButton = CustomButton(frame: CGRectMake(0, self.view.frame.height - 86, self.view.frame.width, 35))
        previousPlayerButton.backgroundColor = .redColor()
        previousPlayerButton.setTitle("Previous Player", forState: .Normal)
        previousPlayerButton.addTarget(self, action: #selector(previousPlayerButtonTapped(_:)), forControlEvents: .TouchUpInside)
        
        self.view.addSubview(previousPlayerButton)
    }
    
    func nextPlayerButtonTapped(sender: CustomButton) {
        sender.moveRight()
        if let image = PlayerController.sharedController.nextPlayer() {
            imageViewHolderView.moveInFromRight({ (readyForImage) in
                if readyForImage {
                    self.playerImageView.image = image
                    self.playerNameLabel.text = image.accessibilityIdentifier!
                }
            })
        } else {
            if PlayerController.sharedController.currentIndex == PlayerController.sharedController.players.count - 1 {
                self.shakeImage(self.imageViewHolderView)
                showFirstOrLastPlayerLabelWithText("Last Player")
            }
        }
    }
    
    func previousPlayerButtonTapped(sender: CustomButton) {
        sender.moveLeft()
        if let image = PlayerController.sharedController.previousPlayer() {
            imageViewHolderView.moveInFromLeft({ (readyForImage) in
                if readyForImage {
                    self.playerImageView.image = image
                    self.playerNameLabel.text = image.accessibilityIdentifier!
                }
            })
        } else {
            if PlayerController.sharedController.currentIndex == 0 {
                self.shakeImage(self.imageViewHolderView)
                showFirstOrLastPlayerLabelWithText("First Player")
            }
        }
    }
    
    func showFirstOrLastPlayerLabelWithText(text: String) {
        self.firstLastLabel.text = text
        UIView.animateWithDuration(1.0, animations: { 
            self.firstLastLabel.alpha = 1.0
            self.firstLastLabel.textColor = .whiteColor()
            }) { (_) in
                UIView.animateWithDuration(1.5, delay: 0.8, options: [], animations: { 
                    self.firstLastLabel.textColor = .whiteColor()
                    self.firstLastLabel.alpha = 0.0
                    }, completion: nil)
        }
    }
    
    func shakeImage(view: UIView) {
        self.view.bringSubviewToFront(view)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [view.frame.origin.x + view.frame.width / 2,
                            view.frame.origin.x + view.frame.width / 2 - 15,
                            view.frame.origin.x + view.frame.width / 2,
                            view.frame.origin.x + view.frame.width / 2 + 15,
                            view.frame.origin.x + view.frame.width / 2]
        animation.duration = 0.1
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.repeatCount = 3.0
        view.layer.addAnimation(animation, forKey: "shake")
    }
}


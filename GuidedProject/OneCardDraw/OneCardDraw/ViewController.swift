//
//  ViewController.swift
//  OneCardDraw/Users/Nate-Dawg/Desktop/DevMountain Mentor/iOS6/Modules/module18/GuidedProject/DeckOfOneCard/DeckOfOneCard/ImageController.swift
//
//  Created by Nathan on 6/1/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var computerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func playGameTapped(sender: AnyObject) {
        GameController.playGame { (winner, playerCard, computerCard) in
            ImageController.imageForUrl(playerCard.imageString, completion: { (image) in
                self.playerImageView.image = image
            })
            ImageController.imageForUrl(computerCard.imageString, completion: { (image) in
                self.computerImageView.image = image
            })
            
            var resultText = ""
            if winner == .Player {
                resultText = "You win!"
            } else if winner == .Tie {
                resultText = "It's a tie"
            } else {
                resultText = "You lost!"
            }
            
            let alertController = UIAlertController(title: resultText, message: nil, preferredStyle: .Alert)
            let dismissAction = UIAlertAction(title: "Dismiss", style: .Cancel, handler: nil)
            alertController.addAction(dismissAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

}


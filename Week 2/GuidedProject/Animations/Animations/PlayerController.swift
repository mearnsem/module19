//
//  PlayerController.swift
//  Animations
//
//  Created by Justin Smith on 6/8/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import Foundation
import UIKit

class PlayerController {
    
    static let sharedController = PlayerController()
    
    var currentIndex = 0
    
    let players: [UIImage] = [UIImage(named: "Steve")!,
                              UIImage(named: "Jennifer")!,
                              UIImage(named: "Captain")!,
                              UIImage(named: "Reese")!,
                              UIImage(named: "Tim")!,
                              UIImage(named: "Taylor")!]
    
    func nextPlayer() -> UIImage? {
        if currentIndex != players.endIndex - 1 {
            currentIndex = currentIndex + 1
            return players[currentIndex]
        } else {
            print("You are on the last player")
            return nil
        }
    }
    
    func previousPlayer() -> UIImage? {
        if currentIndex != players.startIndex {
            currentIndex = currentIndex - 1
            return players[currentIndex]
        } else {
            print("You are on the first player")
            return nil
        }
    }
}
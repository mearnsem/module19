//
//  GameController.swift
//  OneCardDraw
//
//  Created by Emily Mearns on 6/2/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class GameController {
    
    enum Winner {
        case Player
        case Computer
        case Tie
    }
    
    static func playGame(completion: (winner: Winner, playerCard: Card, computerCard: Card) -> Void) {
        CardController.drawCards(2) { (cards) in
            guard cards.count == 2 else {
                fatalError("Could not draw two cards for game")
            }
            let playerCard = cards[0]
            let computerCard = cards[1]
            if playerCard.intValue > computerCard.intValue {
                completion(winner: .Player, playerCard: playerCard, computerCard: computerCard)
            } else if playerCard.intValue == computerCard.intValue {
                completion(winner: .Tie, playerCard: playerCard, computerCard: computerCard)
            } else {
                completion(winner: .Computer, playerCard: playerCard, computerCard: computerCard)
            }
        }
    }
}
//
//  Card.swift
//  DeckOfCards
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Card {
    
    let value: String
    let suit: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let value = dictionary["value"] as? String, suit = dictionary["suit"] as? String else {return nil}
        
        self.value = value
        self.suit = suit
    }
    
}
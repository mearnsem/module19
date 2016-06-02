//
//  Card.swift
//  OneCardDraw
//
//  Created by Emily Mearns on 6/2/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class Card {
    
    private let keySuit = "suit"
    private let keyValue = "value"
    private let keyImageString = "image"
    
    let suit: String
    let value: String
    let imageString: String
    var intValue: Int {
        switch value {
        case "ACE":
            return 14
        case "KING":
            return 13
        case "QUEEN":
            return 12
        case "JACK":
            return 11
        default:
            return Int(value) ?? Int()
        }
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let suit = dictionary[keySuit] as? String, value = dictionary[keyValue] as? String, imageString = dictionary[keyImageString] as? String else {return nil}
        
        self.suit = suit
        self.value = value
        self.imageString = imageString
    }
    
}
//
//  CardController.swift
//  DeckOfCards
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class CardController {
    
    var cards: [Card] = []
    
    static let baseUrl = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/?count=52")
    
    static func getCard(completion: (card: Card?) -> Void) {
        guard let url = baseUrl else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data, cardDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject] else {
                completion(card: nil)
                return
            }
            print(data)
            print(cardDictionary)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                let card = Card(dictionary: cardDictionary)
                completion(card: card)
            })
            return
            
            
        }
    }
    
}
//
//  CardController.swift
//  OneCardDraw
//
//  Created by Emily Mearns on 6/2/16.
//  Copyright © 2016 Falcone Development. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseUrl = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void) {
        guard let url = baseUrl else {
            fatalError("URL for cards is nil")
        }
        
        let urlParameters = ["count": "\(numberOfCards)"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let unwrappedData = data else {
                completion(cards: [])
                return
            }
            print(unwrappedData)
            guard let jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(unwrappedData, options: .AllowFragments) else {
                completion(cards: [])
                return
            }
            print(jsonAnyObject)
            guard let jsonDictionary = jsonAnyObject as? [String: AnyObject] else {
                completion(cards: [])
                return
            }
            print(jsonDictionary)
            guard let cardDictionaries = jsonDictionary["cards"] as? [[String: AnyObject]] else {
                completion(cards: [])
                return
            }
            print(cardDictionaries)
            let cards = cardDictionaries.flatMap {Card(dictionary: $0)}
            print(cards)
            completion(cards: cards)
        }
    }
    
}
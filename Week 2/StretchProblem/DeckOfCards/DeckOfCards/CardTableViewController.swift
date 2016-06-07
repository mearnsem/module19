//
//  CardTableViewController.swift
//  DeckOfCards
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {

    let cardController = CardController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CardController.getCard { (card) in
            
        }
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardController.cards.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath)

        let card = cardController.cards[indexPath.row]
        cell.textLabel?.text = card.value
        cell.detailTextLabel?.text = card.suit

        return cell
    }
    



}

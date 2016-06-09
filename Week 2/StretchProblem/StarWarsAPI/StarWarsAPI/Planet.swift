//
//  Planet.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/9/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Planet {
    
    let name: String
    let diameter: String
    let terrain: String
    
    init?(dictionary: [String: AnyObject]) {
        guard let name = dictionary["name"] as? String, diameter = dictionary["diameter"] as? String, terrain = dictionary["terrain"] as? String else {return nil}
        self.name = name
        self.diameter = diameter
        self.terrain = terrain
    }
    
}
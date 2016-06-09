//
//  PlanetController.swift
//  StarWarsAPI
//
//  Created by Emily Mearns on 6/9/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class PlanetController {
    
    static let baseUrl = NSURL(string: "http://swapi.co/api/planets/3/")
    
    static func getPlanet(completion: (planet: Planet?) -> Void) {
        guard let url = baseUrl else {return}
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data else {
                completion(planet: nil)
                return
            }
            print(data)
        }
    }
    
}
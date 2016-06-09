//
//  Student.swift
//  StudentPostAPI
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class Student {
    
    let name: String
    
    var jsonValue: [String: AnyObject] {
        return [name: name]
    }
    
    var jsonData: NSData? {
        return try? NSJSONSerialization.dataWithJSONObject(jsonValue, options: .PrettyPrinted)
    }
    
    var endpoint: NSURL? {
        return StudentController.baseUrl?.URLByAppendingPathComponent(name).URLByAppendingPathExtension("json")
    }
    
    init(name: String) {
        self.name = name
    }
    
}
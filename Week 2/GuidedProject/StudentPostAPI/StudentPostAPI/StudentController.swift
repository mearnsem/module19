//
//  StudentController.swift
//  StudentPostAPI
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import Foundation

class StudentController {
    
    static let baseUrl = NSURL(string: "https://mykestudentapi.firebaseio.com/students")
    static let getterEndpoint = baseUrl?.URLByAppendingPathExtension("json")
    
    static func getStudents(completion: (students: [Student]) -> Void) {
        guard let url = getterEndpoint else { return }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data, jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject], mykeStudents = jsonDictionary["group_myke"] as? [String] else {
                completion(students: [])
                return
            }
            
            dispatch_async(dispatch_get_main_queue(), { 
                let bestStudents = mykeStudents.flatMap({Student(name: $0)})
                completion(students: bestStudents)
            })
            
            print(data)
            print(mykeStudents)
        }
    }
    
    static func uploadStudent(name: String) {
        let student = Student(name: name)
        guard let requestURL = student.endpoint else { return }
        
        NetworkController.performRequestForURL(requestURL, httpMethod: .Put, body: student.jsonData) { (data, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription)")
            } else {
                print("Successfully uploaded student")
            }
            
        }
    }
}
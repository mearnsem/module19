//
//  StudentTableViewController.swift
//  StudentPostAPI
//
//  Created by Emily Mearns on 6/7/16.
//  Copyright © 2016 Emily Mearns. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    
    var studentArray: [Student] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        StudentController.getStudents { (students) in
            self.studentArray = students
            self.tableView.reloadData()
        }
    }

    @IBAction func addButtonTapped(sender: AnyObject) {
        StudentController.uploadStudent("George")
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentCell", forIndexPath: indexPath)

        let student = studentArray[indexPath.row]
        cell.textLabel?.text = student.name

        return cell
    }

}

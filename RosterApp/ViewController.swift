//
//  ViewController.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.names.count
  }
  
  var names = [Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    self.loadFromArchive()
    
    if self.names.isEmpty {
      println("loading from plist")
      if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist") {
        if let plistArray = NSArray(contentsOfFile: filePath) {
          for personObject in plistArray {
            if let personDictionary = personObject as? NSDictionary {
              let firstName = personDictionary["firstName"] as String
              let lastName = personDictionary["lastName"] as String
              let person = Person(firstName: firstName, lastName: lastName)
              self.names.append(person)
            }
          }
        } else {
        }
      }
      self.saveToArchive()
    }
    self.tableView.dataSource = self
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()
    self.saveToArchive()
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonTableViewCell
    let person = self.names[indexPath.row]
    cell.FirstNameLabel.text = person.firstName
    cell.LastNameLabel.text = person.lastName
    cell.PictureImage.image = person.pictureOfPerson
    print(person.bioOfPerson)
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "DetailedView" {
      var segueNorm = segue.destinationViewController as PersonDetailViewController
      var selectedRow = self.tableView.indexPathForSelectedRow()
      var person = self.names[selectedRow!.row]
      segueNorm.selectedUser = person
    }
  }
  
  func loadFromArchive() {
    println("Begin loading")
    let path = getDocumentsPath()
    let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(path + "/MyArchive") as? [Person]
    if arrayFromArchive != nil {
      self.names = arrayFromArchive!
    }
    println("End loading")
  }
  
  func saveToArchive() {
    println("Begin Saving")
    let path = self.getDocumentsPath()
    NSKeyedArchiver.archiveRootObject(self.names, toFile: path + "/MyArchive")
    println("End Saving")
}

  func getDocumentsPath() -> String {
    println("Begin getting path")
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
    let path = paths.first as String
    println(path + " End getting path")
    return path

  }
}


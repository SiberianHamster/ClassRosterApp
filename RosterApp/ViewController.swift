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
    self.tableView.dataSource = self
    self.tableView.delegate = self
    super.viewDidLoad()
    
    if let filePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"){
      println(filePath)
      if let plistArray = NSArray(contentsOfFile: filePath){
        println(plistArray.count)
      }
    }
    

    
//    let Amethyst = Person(firstName: "Amy", lastName: "Winston")
//    let Aquaman = Person(firstName: "Arthur", lastName: "Curry")
//    let Batgirl = Person(firstName: "Barbara", lastName: "Gordon")
//    let Batman = Person(firstName: "Bruce", lastName: "Wayne")
//    let Beastboy = Person(firstName: "Garfield", lastName: "Logan")
//    let Catwoman = Person(firstName: "Selina", lastName: "Kyle")
//    let Cyborg = Person(firstName: "Victor", lastName: "Stone")
//    let Flash = Person(firstName: "Barry", lastName: "Allen")
//    let Greenarrow = Person(firstName: "Oliver", lastName: "Queen")
//    let Greenlantern = Person(firstName: "Hal", lastName: "Jordan")
//    let Hawkgirl = Person(firstName: "Shayera", lastName: "Hol")
//    let Hawkman = Person(firstName: "Carter", lastName: "Hall")
//    let Mera = Person(firstName: "Mera", lastName: "")
//    let Nightwing = Person(firstName: "Richard", lastName: "Grayson")
//    let Pandora = Person(firstName: "Pandora", lastName: "")
//    let Powergirl = Person(firstName: "Kara", lastName: "Zor-El")
//    let Raven = Person(firstName: "Rachel", lastName: "Roth")
//    let Robin = Person(firstName: "Richard", lastName: "Grayson")
//    let Shazam = Person(firstName: "Billy", lastName: "Batson")
//    let Superman = Person(firstName: "Kal", lastName: "El")
//    let Supergirl = Person(firstName: "Kara", lastName: "Zor-El")
//    let Starfire = Person(firstName: "Koriand'r", lastName: "")
//    let Wonderwoman = Person(firstName: "Diana", lastName: "")
//    let Zatanna = Person(firstName: "Zatanna", lastName: "Zatara")
//    self.names.append(Amethyst)
//    self.names.append(Aquaman)
//    self.names.append(Batgirl)
//    self.names.append(Batman)
//    self.names.append(Beastboy)
//    self.names.append(Catwoman)
//    self.names.append(Cyborg)
//    self.names.append(Flash)
//    self.names.append(Greenarrow)
//    self.names.append(Greenlantern)
//    self.names.append(Hawkgirl)
//    self.names.append(Hawkman)
//    self.names.append(Mera)
//    self.names.append(Nightwing)
//    self.names.append(Pandora)
//    self.names.append(Powergirl)
//    self.names.append(Raven)
//    self.names.append(Robin)
//    self.names.append(Shazam)
//    self.names.append(Superman)
//    self.names.append(Supergirl)
//    self.names.append(Starfire)
//    self.names.append(Wonderwoman)
//    self.names.append(Zatanna)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.reloadData()    
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonTableViewCell
    let person = self.names[indexPath.row]
//    cell.textLabel?.text = person.firstName
    cell.FirstNameLabel.text = person.firstName
    cell.LastNameLabel.text = person.lastName
    cell.PictureImage.image = person.pictureOfPerson
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

}


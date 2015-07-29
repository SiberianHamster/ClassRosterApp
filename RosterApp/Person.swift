//
//  Person.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
  var firstName = "John"
  var lastName = "Doe"
  var bioOfPerson = "This is some filler text"
  var pictureOfPerson = UIImage (named: "NoImages.png")
  
  init (firstName: String, lastName: String){
    self.firstName = firstName
    self.lastName = lastName
  }
  
  required init(coder aDecoder: NSCoder) {
    self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    self.pictureOfPerson = aDecoder.decodeObjectForKey("image") as? UIImage
    self.bioOfPerson = aDecoder.decodeObjectForKey("bioText") as! String
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    aCoder.encodeObject(self.pictureOfPerson, forKey: "image")
    aCoder.encodeObject(self.bioOfPerson, forKey: "bioText")
  }
}



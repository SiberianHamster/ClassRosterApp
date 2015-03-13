//
//  Person.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class Person {
  var firstName = "John"
  var lastName = "Doe"
  var pictureOfPerson = UIImage (named: "NoImages.png")
  var bioOFPerson = "This is some filler text"
  
  init (firstName: String, lastName: String){
    self.firstName = firstName
    self.lastName = lastName
  }
}



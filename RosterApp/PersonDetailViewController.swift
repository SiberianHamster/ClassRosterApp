//
//  PersonDetailViewController.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
  
  var selectedUser = Person(firstName: "FakeTemp", lastName: "FakeTemp")
  
  @IBOutlet weak var FirstNameLabel: UILabel!
  @IBOutlet weak var LastNameLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = self.selectedUser.firstName
    FirstNameLabel.text = self.selectedUser.firstName
    LastNameLabel.text = self.selectedUser.lastName
  }
}

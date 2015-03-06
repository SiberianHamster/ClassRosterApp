//
//  PersonDetailViewController.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var FirstNameLabel: UITextField!
  
  @IBOutlet weak var LastNameLabel: UITextField!
  
  var selectedUser = Person(firstName: "FakeTemp", lastName: "FakeTemp")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = self.selectedUser.firstName
    FirstNameLabel.text = self.selectedUser.firstName
    LastNameLabel.text = self.selectedUser.lastName
    FirstNameLabel.delegate = self
    LastNameLabel.delegate = self
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}

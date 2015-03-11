//
//  PersonDetailViewController.swift
//  RosterApp
//
//  Created by Mark Lin on 2/28/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var FirstNameLabel: UITextField!
  
  @IBOutlet weak var BioField: UITextView!
  
  @IBOutlet weak var LastNameLabel: UITextField!
  
  @IBOutlet weak var ImagePlace: UIImageView!
  
  @IBAction func PhotoButton(sender: UIButton) {
    let imageViewPicked = UIImagePickerController()
    imageViewPicked.delegate = self
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){imageViewPicked.sourceType = UIImagePickerControllerSourceType.Camera
    }else{
      imageViewPicked.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    }
    self.presentViewController(imageViewPicked, animated: true, completion: nil)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    let image = info[UIImagePickerControllerOriginalImage] as UIImage
    self.ImagePlace.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
  var tempImage = UIImage()
  
  var selectedUser = Person(firstName: "FakeTemp", lastName: "FakeTemp")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = self.selectedUser.firstName
    FirstNameLabel.text = self.selectedUser.firstName
    LastNameLabel.text = self.selectedUser.lastName
    FirstNameLabel.delegate = self
    LastNameLabel.delegate = self
    ImagePlace.image = selectedUser.pictureOfPerson
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    selectedUser.firstName = FirstNameLabel.text
    selectedUser.lastName = LastNameLabel.text
    let currentimage = ImagePlace.image
    selectedUser.pictureOfPerson = currentimage
  }
  
}

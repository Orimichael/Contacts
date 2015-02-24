//
//  ViewController.swift
//  Contacts
//
//  Created by Ori's Air on 2/20/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBAction func enter(sender: UIButton) {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        addressTextField.delegate = self
        phoneTextField.delegate = self
        
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        addressTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        
        var firstName = firstNameTextField.text
        var lastName = lastNameTextField.text
        var address = addressTextField.text
        var phone = phoneTextField.text
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as ContactsTableViewController
        destination.contactArray.append(Contacts(firstName: firstNameTextField.text, lastName: lastNameTextField.text, phoneNumber: phoneTextField.text, address: addressTextField.text, photo: userPhoto.highlightedImage))
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

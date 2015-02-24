//
//  DetailViewController.swift
//  Contacts
//
//  Created by Ori's Air on 2/20/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    var contact: Contacts?
    
    @IBOutlet weak var name: UILabel!
    
    
    @IBOutlet weak var address: UILabel!
    
    
    @IBOutlet weak var phone: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getName()
        getAddress()
        getPhone()
        getImage()
   //     guessTextField.delegate = self
    }
    
    func getName() {
        // sets a name to the Name label field
        if let firstName = contact?.firstName {
            name.text = firstName
        } else {
            name.text = "First name Unknown "
        }
        if let lastName = contact?.lastName {
            name.text = name.text! + " \(lastName)"
        } else {
            name.text = name.text! + " Last name is Unknown"
        }
    }
    
    func getAddress() {
        // sets an address to the Address label field
        if let contactAddress = contact?.address {
            address.text = contactAddress
        } else {
            address.text = "Address is unknown"
        }
    }
    
    func getPhone() {
        // sets a phone number to the phone number label field
        if let contactPhone = contact?.phoneNumber {
            phone.text = contactPhone
        } else {
            phone.text = "Phone number is unknown"
        }
    }
    
    func getImage() {
        // need to set imageView.image to an image the user can upload...presumably prompting user to access Photos/Camera Roll and allowing selection of an image
        if let contactPhoto = contact?.photo {
            imageView.image = contactPhoto
        } else {
            imageView.image = nil
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

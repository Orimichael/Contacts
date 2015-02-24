//
//  ContactClass.swift
//  Contacts
//
//  Created by Ori's Air on 2/20/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import Foundation
import UIKit

class Contacts: NSObject {
    
    var firstName: String?
    
    var lastName: String?
    
    var phoneNumber: String?
    
    var address: String?
    
    var photo: UIImage?
    
    init (firstName: String? = nil, lastName: String? = nil, phoneNumber:String? = nil, address:String? = nil, photo: UIImage? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
        self.address = address
        self.photo = photo
    }
    
}
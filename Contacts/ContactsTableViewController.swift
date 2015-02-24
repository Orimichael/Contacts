//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Ori's Air on 2/20/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    let newContact = Contacts()
    
    var contactArray = [Contacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var moveButton = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
        // moveButton initialized to .Edit mode when touched
        
        self.navigationItem.leftBarButtonItem = moveButton

        
        let ori = Contacts(firstName: "Ori", lastName: "Benhamou", phoneNumber: "617-501-7430")
        let maly = Contacts(firstName: "Maly", lastName: "Oron-Benhamou", phoneNumber: "857-210-3960")
        let jonathan = Contacts(firstName: "Jonathan", lastName: "Benhamou", phoneNumber: nil, address: "1623 Third Avenue", photo: UIImage(named: "Jonathan.JPG"))
        let nir = Contacts(firstName: "Nir", lastName: "Oron", photo: UIImage(named: "Nir.JPG"))
        let enya = Contacts(firstName: "Enya", lastName: "Singer", phoneNumber: nil, address: nil, photo: UIImage(named: "Enya.jpeg"))
        
        // load contact Array with a few samples
        self.contactArray.append(ori)
        self.contactArray.append(maly)
        self.contactArray.append(jonathan)
        self.contactArray.append(nir)
        self.contactArray.append(enya)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.contactArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell1", forIndexPath: indexPath) as UITableViewCell

         // Configure the cell...
        
        let contact = self.contactArray[indexPath.row]
        
        if let name = contact.firstName {
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = "No Name"
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        let contactMoving = self.contactArray.removeAtIndex(fromIndexPath.row)
        self.contactArray.insert(contactMoving, atIndex: toIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if tableView.editing {
            return .None
        } else {
            return .Delete
        }
    }
    
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "contactsDetailSegue" {
            let indexPath = self.tableView.indexPathForCell(sender as UITableViewCell)!
            let contact = self.contactArray[indexPath.row]
            var destination = segue.destinationViewController as DetailViewController
            destination.contact = contact
        }
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(contactArray, forKey: "newContact")
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            self.contactArray.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    func toggleEdit() -> Bool {
        self.tableView.setEditing(!self.tableView.editing, animated: true)
        if self.tableView.editing {
            // Button title = Done when currently editing
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("toggleEdit"))
            return true
        } else {
            // Button title = False when done editing
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: Selector("toggleEdit"))
            return false
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

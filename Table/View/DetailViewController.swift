//
//  DetailViewController.swift
//  Table
//
//  Created by Anshuman Dahale on 18/07/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import UIKit
import Eureka

class DetailViewController: FormViewController {
    
    var player: Player!
    var editable: Bool = false
    
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = player.firstName
        
        form +++ Section("Personal Details")
            <<< TextRow () { row in
                
                row.placeholder = "Player Name"
                row.tag = "name"
                row.value = player.firstName
                row.baseCell.isUserInteractionEnabled = editable
                
            }
            <<< TextRow () { row in
                
                row.placeholder = "Player Last Name"
                row.tag = "lastName"
                row.value = player.lastName
                row.baseCell.isUserInteractionEnabled = editable
                
            }
            <<< DateRow () { row in
                
                row.title = "Date of birth"
                row.tag = "dob"
                row.value = player.dob
                row.baseCell.isUserInteractionEnabled = editable
        }
        
        form +++ Section("Professional Details")
            <<< IntRow () { row in
                
                row.title = "Matches"
                row.tag = "matches"
                row.value = player.matches
                row.baseCell.isUserInteractionEnabled = editable
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: IBActions
    
    @IBAction func editButton_TouchUpInside(_ sender: Any) {
        
        let button:UIBarButtonItem = sender as! UIBarButtonItem
        if(button.title == "Edit") {
            
            button.title = "Done"
            editable = false
        }
        else if(button.title == "Done") {
            
            button.title = "Edit"
            editable = true
        }
        
        self.tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

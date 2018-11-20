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
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = player.firstName
        
        form +++ Section("Personal Details")
            <<< TextRow () { row in
                
                row.placeholder = "Player Name"
                row.tag = "name"
                row.value = player.firstName
            }
            <<< TextRow () { row in
                
                row.placeholder = "Player Last Name"
                row.tag = "lastName"
                row.value = player.lastName
            }
            <<< DateRow () { row in
                
                row.title = "Date of birth"
                row.tag = "dob"
                row.value = player.dob
        }
        
        form +++ Section("Professional Details")
            <<< IntRow () { row in
                
                row.title = "Matches"
                row.tag = "matches"
                row.value = player.matches
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

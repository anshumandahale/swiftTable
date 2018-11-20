//
//  AddPlayerAlertViewController.swift
//  Table
//
//  Created by Anshuman Dahale on 14/08/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import UIKit
import Eureka



protocol AddPlayerAlertProtocol {

    func addedPlayerWithName (_ player: Player?)
}


class AddPlayerAlertViewController: FormViewController {

    @IBOutlet weak var playerNameTextField: UITextField!
    var delegate : AddPlayerAlertProtocol?
    
    
    //MARK: - IBActions
    @IBAction func closeButton_TouchUpInside (_ sender: Any) {
        
        self.dismiss(animated: true) {
            
            print("Dismissing popup")
            self.delegate?.addedPlayerWithName(nil)
        }
    }
    
    @IBAction func doneButton_TouchUpInside (_ sender: Any) {
        
        let formValues = form.values()
        print(formValues)
        
        let name:String = (formValues["name"] as! String?)!
        
        let player = Player.init(firstName: name,
                                 lastName:  formValues["lastName"] as! String,
                                 date:      formValues["dob"] as! Date,
                                 matches:   formValues["matches"] as! Int)
        
        self.delegate?.addedPlayerWithName(player)
        
        self.dismiss(animated: true) {
            
//            print("User entered name: "+self.playerNameTextField.text!)
//            self.delegate?.addedPlayerWithName(self.playerNameTextField.text)
//            self.delegate?.addedPlayerWithName(name)
        }
    }
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        form +++ Section("Personal Details")
            <<< TextRow () { row in
                row.placeholder = "Player Name"
                row.tag = "name"
            }
            <<< TextRow () { row in
                row.placeholder = "Player Last Name"
                row.tag = "lastName"
            }
            <<< DateRow () { row in
                row.title = "Date of birth"
                row.tag = "dob"
        }
        
        form +++ Section("Professional Details")
            <<< IntRow () { row in
                row.title = "Matches"
                row.tag = "matches"
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

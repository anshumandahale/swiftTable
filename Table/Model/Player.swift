//
//  Player.swift
//  Table
//
//  Created by Anshuman Dahale on 21/08/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import Foundation


class Player {
    
    var firstName: String = ""
    var lastName: String = ""
    var dob: Date = Date()
    var matches: Int = 0
    
    
    init (firstName: String, lastName: String, date: Date, matches: Int) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.dob = date
        self.matches = matches
    }
    
}

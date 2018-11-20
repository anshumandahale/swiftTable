//
//  DataManager.swift
//  Table
//
//  Created by Anshuman Dahale on 15/11/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import Foundation

class DataManager {
    
    func getPlayers () -> Array<Any> {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let virat = Player.init(firstName: "Virat", lastName: "Kohli", date: formatter.date(from: "24/01/1988")!, matches: 100)
        let rohit = Player.init(firstName: "Rohit", lastName: "Sharma", date: formatter.date(from: "01/06/1989")!, matches: 50)
        let mahi = Player.init(firstName: "Mahendra", lastName: "Singh", date: formatter.date(from: "05/07/1984")!, matches: 150)
        
        return [virat, rohit, mahi]
    }
}

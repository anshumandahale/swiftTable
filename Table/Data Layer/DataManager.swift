//
//  DataManager.swift
//  Table
//
//  Created by Anshuman Dahale on 15/11/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import Foundation
import CoreData


class DataManager {
    
    let coreDataManager = CoreDataManager.shared
    
    
//    func getPlayers () -> Array<Any> {
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//
//        let virat = Player.init(firstName: "Virat", lastName: "Kohli", date: formatter.date(from: "24/01/1988")!, matches: 100)
//        let rohit = Player.init(firstName: "Rohit", lastName: "Sharma", date: formatter.date(from: "01/06/1989")!, matches: 50)
//        let mahi = Player.init(firstName: "Mahendra", lastName: "Singh", date: formatter.date(from: "05/07/1984")!, matches: 150)
//
//        return [virat, rohit, mahi]
//    }
    
    
    func save(player:Player) -> (Bool, String) {
        
        let managedContext = coreDataManager.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "PlayerEntity", in: managedContext)!
        
        let playerEntity = NSManagedObject(entity: entity, insertInto: managedContext)
        playerEntity.setValue(player.firstName, forKey: "firstName")
        playerEntity.setValue(player.lastName, forKey: "lastName")
        playerEntity.setValue(player.dob, forKey: "dob")
        playerEntity.setValue(player.matches, forKey: "matches")
        
        do {
            try managedContext.save()
            return(true,"")
        }
        catch let error as NSError {
            return (false, error.localizedDescription)
        }
    }
    
    
    /// Get Players saved in Core Data
    ///
    /// - Returns: Array of Players
    
    func getPlayers() -> (Array<Player>, String) {
        
        let managedContext = coreDataManager.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>.init(entityName: "PlayerEntity")
        var players = Array<Player>()
        
        
        do {
            
            let fetchResult = try managedContext.fetch(fetchRequest)
            for aResult in fetchResult {
                
                let playerEntity:PlayerEntity = aResult as! PlayerEntity
                let player = Player(firstName: playerEntity.firstName ?? "", lastName: playerEntity.lastName ?? "", date: playerEntity.dob ?? NSDate() as Date, matches: Int(playerEntity.matches))
                players.append(player)
            }
            
            return (players,"")
        }
        catch let error as NSError {
            return ([],error.localizedDescription)
        }
    }
    
}

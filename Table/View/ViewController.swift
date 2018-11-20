//
//  ViewController.swift
//  Table
//
//  Created by Anshuman Dahale on 05/07/18.
//  Copyright © 2018 Anshuman Dahale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddPlayerAlertProtocol {
    
    
    @IBOutlet weak var tableView:UITableView?
    
    var names:Array<Any>?
    var selectedPlayer:Player?
    
    let dataManager:DataManager? = DataManager.init()
    
    //MARK: - AddPlayerAlertProtocol Delegate
    func addedPlayerWithName (_ player: Player?) {
        
        if((player) != nil ) {
            
            print("User added player: " + (player?.firstName)!)
//            names?.add(player!)
            names?.append(player!)
            tableView?.reloadData()
        }
    }
    
    
    //MARK: - Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (names?.count)!;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")!
        
        let player:Player = names![indexPath.row] as! Player
        
        cell.textLabel?.text = player.firstName
        return cell
    }
    
    //MARK: - Table Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedPlayer = (names![indexPath.row] as! Player)
        
//        print("Selected " + (names![indexPath.row] as! String))
//        selectedPlayer = names![indexPath.row] as? String
        
        self.performSegue(withIdentifier: "segueToDetailVC", sender: self)
    }
    
    //MARK: - IBAction
    
    /// Method call after clicking **ADD BUTTON**
    ///
    /// - Parameter sender: sender object can be nil/any
    @IBAction func addButton_TouchUpInside(_ sender: Any) {
        
//        let alert:UIAlertController = UIAlertController (title: "Add Player", message: "Add player name", preferredStyle: .alert)
//        let okAction:UIAlertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
//
//            print("Alert Ok pressed")
//        }
//        alert.addAction(okAction)
//        self.present(alert, animated:true, completion: nil)
        
        self.performSegue(withIdentifier: "segueToAddPlayer", sender: self)
        
    }
    
    
//    func alertOkButtonAction {
    
//    }
    
    
    //MARK: - View Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Hello Swift"
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        let virat = Player.init(firstName: "Virat", lastName: "Kohli", date: formatter.date(from: "24/01/1988")!, matches: 100)
//        let rohit = Player.init(firstName: "Rohit", lastName: "Sharma", date: formatter.date(from: "01/06/1989")!, matches: 50)
//        let mahi = Player.init(firstName: "Mahendra", lastName: "Singh", date: formatter.date(from: "05/07/1984")!, matches: 150)
//        names = [virat, rohit, mahi]
        
        let dataManager = DataManager.init()
        names = dataManager.getPlayers()

        
        //Add Navigation Bar button programatically
        //navigationItem.rightBarButtonItem = UIBarButtonItem (title: "  +  ", style: .done, target: self, action: #selector(addButton_TouchUpInside(_:)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToDetailVC" {
            
            let vc = segue.destination as? DetailViewController
            vc?.player = selectedPlayer
        }
        
        if segue.identifier == "segueToAddPlayer" {
            
            let nvc = segue.destination as? UINavigationController
            
            let vc = nvc?.viewControllers[0] as? AddPlayerAlertViewController //segue.destination as? AddPlayerAlertViewController
            vc?.delegate = self
        }
        
    }


}


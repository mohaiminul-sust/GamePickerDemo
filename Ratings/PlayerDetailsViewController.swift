//
//  PlayerDetailsViewController.swift
//  Ratings
//
//  Created by Mohaiminul Islam on 5/17/16.
//  Copyright © 2016 infancyit. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    
    var player: Player?
    var game: String = "Chess"{
        didSet {
            detailLabel.text = game
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        print("loading players details view")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deallocating players details view")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
    
    // MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetails" {
            player = Player(name: nameTextField.text, game: game, rating: 3)
        }
        
        if segue.identifier == "PickGame" {
            
            //update selectedGame in GamePickerViewController
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        //update self game from source controller
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController {
            if let selectedGame = gamePickerViewController.selectedGame {
                game = selectedGame
            }
        }
    }
}

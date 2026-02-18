//
//  SecondViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/26/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit

class FlashCardsViewController: UIViewController {
    
    var message = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFlashCard" {
            if let destVC = segue.destination as? FlashCardViewController {
                destVC.message = message
            }
        }
    }

    @IBAction func comeHereButtonPressed(_ sender: Any) {
        message = "Come Here"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
    @IBAction func preloadButtonPressed(_ sender: Any) {
        message = "Preload?"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
    @IBAction func switchButtonPressed(_ sender: Any) {
        message = "Switch stations"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
    @IBAction func turnOnRobotButtonPressed(_ sender: Any) {
        message = "Turn on Robot"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
    @IBAction func ethernetButtonPressed(_ sender: Any) {
        message = "Plug in Ethernet"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
    @IBAction func rebootRobotButtonPressed(_ sender: Any) {
        message = "Reboot Robot"
        performSegue(withIdentifier: "showFlashCard", sender: self)
    }
    
}


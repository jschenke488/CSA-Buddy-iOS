//
//  FlashCardViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/26/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit

class FlashCardViewController: UIViewController {
    
    var message = ""

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = message
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

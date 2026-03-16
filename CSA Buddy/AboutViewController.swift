//
//  AboutViewController.swift
//  CSA Buddy
//
//  Created by Ken Schenke on 2/27/19.
//  Copyright © 2019 Ken Schenke. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let path = Bundle.main.path(forResource: "LICENSE", ofType: "", inDirectory: "", forLocalization: "") {
            if let contents = try? String(contentsOfFile: path) {
                textView.text = contents
            }
        }
    }
    
}

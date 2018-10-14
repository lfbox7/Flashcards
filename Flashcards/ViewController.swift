//
//  ViewController.swift
//  Flashcards
//
//  Created by Leonard Box on 10/13/18.
//  Copyright © 2018 Leonard Box. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden=true
    }
}


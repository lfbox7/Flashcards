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
    @IBOutlet weak var middleLabel: UILabel!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            // styling answer label
        backLabel.clipsToBounds = true
        backLabel.layer.cornerRadius = 15
        backLabel.layer.shadowRadius = 15
        backLabel.layer.shadowOpacity = 0.3
        
            // styling question label
        frontLabel.clipsToBounds = true
        frontLabel.layer.cornerRadius = 15
        frontLabel.layer.shadowRadius = 15
        frontLabel.layer.shadowOpacity = 0.3
        
            // styling wrong answer label
        middleLabel.clipsToBounds = true
        middleLabel.layer.cornerRadius = 15
        middleLabel.layer.shadowRadius = 15
        middleLabel.layer.shadowOpacity = 0.3
        
            // styling first button
        btnOptionOne.layer.borderWidth = 3
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionOne.layer.cornerRadius = 15
        btnOptionOne.layer.shadowRadius = 15
        btnOptionOne.layer.shadowOpacity = 0.3
        
            // styling second button
        btnOptionTwo.layer.borderWidth = 3
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 15
        btnOptionTwo.layer.shadowRadius = 15
        btnOptionTwo.layer.shadowOpacity = 0.3
        
            // styling second button
        btnOptionThree.layer.borderWidth = 3
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionThree.layer.cornerRadius = 15
        btnOptionThree.layer.shadowRadius = 15
        btnOptionThree.layer.shadowOpacity = 0.3
    }

    @IBAction func tapOnFlashcard(_ sender: Any) {
            // if/else statement to 'loop' through slides
        if frontLabel.isHidden==false {
            frontLabel.isHidden=true
        } else {
            frontLabel.isHidden=false
        }
    }
    
    @IBAction func btnOptionOne(_ sender: Any) {
            // hide and show correct label
        backLabel.isHidden=true
        frontLabel.isHidden=true
        middleLabel.isHidden=false
                // hide and show question label after 1sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.frontLabel.isHidden = false
                self.middleLabel.isHidden = true
            }
    }
    
    @IBAction func btnOptionTwo(_ sender: Any) {
            // hide and show correct label
        backLabel.isHidden=true
        frontLabel.isHidden=true
        middleLabel.isHidden=false
                // hide and show question label after 1sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.frontLabel.isHidden = false
                self.middleLabel.isHidden = true
            }
    }
    
    @IBAction func btnOptionThree(_ sender: Any) {
             // hide and show correct label
        backLabel.isHidden=false
        frontLabel.isHidden=true
        middleLabel.isHidden=true
        // function to move to next question
    }
}


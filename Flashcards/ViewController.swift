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
        backLabel.clipsToBounds = false
        backLabel.layer.cornerRadius = 25
        backLabel.layer.shadowRadius = 15
        backLabel.layer.shadowOpacity = 0.2
        
            // styling question label
        frontLabel.clipsToBounds = false
        frontLabel.layer.cornerRadius = 25
        frontLabel.layer.shadowRadius = 15
        frontLabel.layer.shadowOpacity = 0.2
        
            // styling wrong answer label
        middleLabel.clipsToBounds = false
        middleLabel.layer.cornerRadius = 25
        middleLabel.layer.shadowRadius = 15
        middleLabel.layer.shadowOpacity = 0.2
        
            // styling first button
        btnOptionOne.layer.borderWidth = 3
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionOne.layer.cornerRadius = 15
        btnOptionOne.layer.shadowRadius = 5
        btnOptionOne.layer.shadowOpacity = 0.2
        
            // styling second button
        btnOptionTwo.layer.borderWidth = 3
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 15
        btnOptionTwo.layer.shadowRadius = 5
        btnOptionTwo.layer.shadowOpacity = 0.2
        
            // styling second button
        btnOptionThree.layer.borderWidth = 3
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btnOptionThree.layer.cornerRadius = 15
        btnOptionThree.layer.shadowRadius = 5
        btnOptionThree.layer.shadowOpacity = 0.2
    }

    @IBAction func tapOnFlashcard(_ sender: Any) {
        
            // if/else statement to 'loop' through slides
        if frontLabel.isHidden==false {
            frontLabel.isHidden=true
        } else {
            frontLabel.isHidden=false
        }
    }
    
    func updateFlashcards(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?)
    {
        
            // get question in the frontLabel block
        frontLabel.text = question
        
            // get answer in the backLabel block
        backLabel.text = answer
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(extraAnswerTwo, for: .normal)
        btnOptionThree.setTitle(answer, for: .normal)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            // destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
            // Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
            // controllers to pass information to Creation View Controller
        creationController.flashcardsController = self

        if segue.identifier == "EditSegue"
        {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
    }
}


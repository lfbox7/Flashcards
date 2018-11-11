//
//  ViewController.swift
//  Flashcards
//
//  Created by Leonard Box on 10/13/18.
//  Copyright © 2018 Leonard Box. All rights reserved.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extraAnswerOne: String
    var extraAnswerTwo: String
}

class ViewController: UIViewController {
    
        // IBOutlets instantiating variables
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var middleLabel: UILabel!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
        // array to hold our flashcards
    var flashcards = [Flashcard]()
        // current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // read saved flashcards
        readSavedFlashcards()
            // adding our initial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcards(question: "What's the capital of Brazil?", answer: "Brasília", extraAnswerOne: "São Paulo", extraAnswerTwo: "Rio de Janeiro")
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
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
        let flashcard = Flashcard(question: question, answer: answer, extraAnswerOne: extraAnswerOne!, extraAnswerTwo: extraAnswerTwo!)
            // get question in the frontLabel block
        frontLabel.text = question
            // get answer in the backLabel block
        backLabel.text = answer
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(extraAnswerTwo, for: .normal)
        btnOptionThree.setTitle(answer, for: .normal)
            // adding flashcard in the flashcards array
        flashcards.append(flashcard)
        print("🥂 Added new flashcard")
        print("🥂 We now have \(flashcards.count) flashcards")
            // update buttons
        updateNextPrevButtons()
            // update labels
        updateLabels()
            // save flashcards
        saveAllFlashcardsToDisk()
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
 
            // hide and show question label after 1sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.frontLabel.isHidden = false
            self.middleLabel.isHidden = true
            if self.currentIndex == self.flashcards.count - 1 {
            } else {
                self.didTapOnNext(self)
            }
        }
    }

    func updateLabels() {
            // get current flashcard
        let currentFlashcard = flashcards[currentIndex]
            // update labels
        frontLabel.text = currentFlashcard.question
        // get answer in the backLabel block
        backLabel.text = currentFlashcard.answer
        btnOptionOne.setTitle(currentFlashcard.extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(currentFlashcard.extraAnswerTwo, for: .normal)
        btnOptionThree.setTitle(currentFlashcard.answer, for: .normal)
    }
    
    func updateNextPrevButtons() {
        // Disable next button if button at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
            // disable prev button if at the beginning
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
            // decrease current index
        currentIndex = currentIndex - 1
            // update labels
        updateLabels()
            // update buttons
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
            // increase current index
        currentIndex = currentIndex + 1
            // update labels
        updateLabels()
            // update buttons
        updateNextPrevButtons()
    }
    
    func saveAllFlashcardsToDisk() {
            // from flashcard array to dictionary array
        let dictionaryArray = flashcards.map {
            (card) -> [String: String] in return ["question": card.question, "answer": card.answer, "extraAnswerOne": card.extraAnswerOne, "extraAnswerTwo": card.extraAnswerTwo]
        }
            // save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
            // log it
        print("💃 Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
            // read dictionary array from disk (if any)
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map {
                dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extraAnswerOne: dictionary["extraAnswerOne"]!, extraAnswerTwo: dictionary["extraAnswerTwo"]!)
            }
                // put all these cards in our flashcards array
            flashcards.append(contentsOf: savedCards)
        }
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


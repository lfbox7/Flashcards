//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Leonard Box on 10/27/18.
//  Copyright © 2018 Leonard Box. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    var initialQuestion: String?
    var initialAnswer: String?
    @IBOutlet weak var answerOptOne: UITextField!
    @IBOutlet weak var answerOptTwo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // Do any additional setup after loading the view
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }

    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss (animated: true)
    }
    
     @IBAction func didTapOnDone(_ sender: Any) {
            // get the text in text fields
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let answerOne = answerOptOne.text
        let answerTwo = answerOptTwo.text
        
            // check if text boxes are empty
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            
                // show error
            let alert = UIAlertController (title: "Missing Text", message: "You need to enter both a question and an answer", preferredStyle: UIAlertController.Style.alert)
            present(alert, animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        } else {
            
        }
        
            // call the function to update the flashcard
        flashcardsController.updateFlashcards(question: questionText!, answer: answerText!, extraAnswerOne: answerOne!, extraAnswerTwo: answerTwo!)
        
            // dismiss
        dismiss(animated: true)
     }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

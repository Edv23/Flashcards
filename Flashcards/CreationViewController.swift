//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Erick Veletanga on 10/2/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answer1TextField: UITextField!
    
    @IBOutlet weak var answer2TextField: UITextField!
    
    @IBOutlet weak var answer3TextField: UITextField!
    
    var flashcardsController: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        // get the text in the question text field
        let questionTxt = questionTextField.text
        
        //get the text from the answer field
        
        let answer1Txt = answer1TextField.text
        let answer2Txt = answer2TextField.text
        let answer3Txt = answer3TextField.text
        
        // check if empty
        
        if questionTxt == nil ||  answer1Txt == nil || answer2Txt == nil || answer3Txt == nil  || questionTxt!.isEmpty || answer1Txt!.isEmpty || answer2Txt!.isEmpty || answer3Txt!.isEmpty {
            
            let alert = UIAlertController(title: "Missing text", message: "You need to enter text in all fields", preferredStyle: .alert)
            
            present(alert, animated: true)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
        }
        else {
            // call the function to update the flashcard
            
            flashcardsController.updateFlashcard(question: questionTxt!, answer: answer1Txt!, extraAnswerOne: answer2Txt!, extraAnswerTwo: answer3Txt!)
            
            //Dismiss
            dismiss(animated: true)
        }
        
        
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



//
//  ViewController.swift
//  Flashcards
//
//  Created by Erick Veletanga on 9/13/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var extraAnswerOne: String
    var extraAnswerTwo: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UILabel!
    @IBOutlet weak var btnOptionTwo: UILabel!
    @IBOutlet weak var btnOptionThree: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //Array to hold our flashcards
    
    var flashcards = [Flashcard]()
    
    //current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad( )
        
        readSavedFlashcards()
        
        
        //Adding our initial flashacard if needed
    if flashcards.count == 0 {
        updateFlashcard( question: "What's the name of the company that the employees from  the show 'The office' work for?" , answer: "Google", extraAnswerOne: "Dunder Mifflin" , extraAnswerTwo: "Michael Scott Paper Company")
        }
    else{
            updateLabels()
        
            updateNextPrevButton()
        }
        
    
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds  = true
        
        btnOptionOne.layer.cornerRadius = 20.0
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        btnOptionTwo.layer.cornerRadius = 20.0
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        btnOptionThree.layer.cornerRadius = 15.0
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        // #colorLiteral()
        // Do any additional setup after loading the view.
        
    
    }
    
    
    // Below is the logic to tap the card. This is incase we do basics
    
    //@IBAction func didTapOnFlashCard(_ sender: Any) {
    //if frontLabel.isHidden == true {
    //frontLabel.isHidden = false }
    
    //else { frontLabel.isHidden = true }
    //}
    
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButton()
        
        animateCardOut()
        
    }
    
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex - 1
        
        //update labels
        updateLabels()
        
        //update buttons
        updateNextPrevButton()
        
        animateCardIn_1()
        
    }
    
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }

    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        flipFlashcard()
        backLabel.isHidden = false
        btnOptionOne.isHidden = true
        btnOptionThree.isHidden = true
        btnOptionTwo.isHidden = false
        backLabel.textColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
        backLabel.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1) }
    
    func flipFlashcard(){
        UIView.transition(with: card, duration: 0.2, options: .transitionFlipFromRight) {
            self.frontLabel.isHidden = true
        }
    }
    
    func animateCardOut(){ UIView.animate(withDuration: 0.2, animations: {
        self.card.transform = CGAffineTransform.identity.translatedBy(x: -300, y: 0.0)
    }, completion: { finished in
        
        self.updateLabels()
        self.animateCardIn()
    })
        
    }
    func animateCardIn(){
        
        card.transform =  CGAffineTransform.identity.translatedBy(x: 300, y: 0)
        
        UIView.animate(withDuration: 0.2) {
            self.card.transform = CGAffineTransform.identity
        }
        
    }
    
    
    func flipFlashcard_1(){
        UIView.transition(with: card, duration: 0.2, options: .transitionFlipFromLeft) {
            self.frontLabel.isHidden = true
        }
    }
    
    func animateCardOut_1(){card.transform =  CGAffineTransform.identity.translatedBy(x: 300, y: 0)
        
        UIView.animate(withDuration: 0.2) {
            self.card.transform = CGAffineTransform.identity
        }
        
        
    }
    func animateCardIn_1(){UIView.animate(withDuration: 0.2, animations: {
        self.card.transform = CGAffineTransform.identity.translatedBy(x: -300, y: 0.0)
    }, completion: { finished in
        
        self.updateLabels()
        self.animateCardOut_1()
    })
   
    }
   
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String, extraAnswerTwo: String){
        
        let flashcard = Flashcard(question: question, answer: answer, extraAnswerOne: extraAnswerOne, extraAnswerTwo: extraAnswerTwo)
        frontLabel.text = question
        backLabel.text = extraAnswerOne
        
        btnOptionOne.text = answer
        btnOptionTwo.text = extraAnswerOne
        btnOptionThree.text = extraAnswerTwo
        
        // Adding flashcard in the flashcards array
        flashcards.append(flashcard)
        
        // Logging to the console
        print("😎 Added new flashcard")
        print("😎 We now have \(flashcards.count) flashcards")
        
        //Update current index
        currentIndex = flashcards.count - 1
        print("😎 Our current index is \(currentIndex)")
        
        //update buttons
        updateNextPrevButton()
        
        //Update labels
        updateLabels()
        
        // saves flashcards
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButton(){
        //Disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        // disable prev button if at the beginning
        
        if currentIndex == flashcards.count + 1 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels(){
        
        //get current flashcard
        
        let currentFlashcard = flashcards[currentIndex]
        
        //updare labels
        
        frontLabel.text = currentFlashcard.question
        backLabel.text =  currentFlashcard.extraAnswerOne
        
        btnOptionOne.text = currentFlashcard.answer
        btnOptionTwo.text =  currentFlashcard.extraAnswerOne
        btnOptionThree.text = currentFlashcard.extraAnswerTwo
    }
    
    
    func saveAllFlashcardsToDisk(){
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "extraAnswerOne": card.extraAnswerOne, "extraAnswerTwo": card.extraAnswerTwo]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
            
        print("🎉 FlashCars saved to UserDafaults")
    }
    
    func readSavedFlashcards(){
        if let  dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
            return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, extraAnswerOne: dictionary["extraAnswerOne"]!, extraAnswerTwo: dictionary["extraAnswerTwo"]!)
                
            }
        flashcards.append(contentsOf: savedCards)
        
        print("Done")
            
        }
    }

      
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // We know the destination of the segue is the Navigation Controller
        
        let navigationController = segue.destination as! UINavigationController
        
        //We know the Navigation Controller only contains a Creation View Controller
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        //We set the flashcardsController Property to self
        
        creationController.flashcardsController  = self
    }
    
}

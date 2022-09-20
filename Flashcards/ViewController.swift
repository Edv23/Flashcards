//
//  ViewController.swift
//  Flashcards
//
//  Created by Erick Veletanga on 9/13/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UILabel!
    @IBOutlet weak var btnOptionTwo: UILabel!
    @IBOutlet weak var btnOptionThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad( )
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
    
    
    

    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
            frontLabel.isHidden = true
            backLabel.isHidden = false
            btnOptionOne.isHidden = true
            btnOptionThree.isHidden = true
            btnOptionTwo.isHidden = false
            backLabel.textColor = #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)
            backLabel.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1) }
    
        
    }

//
//  ViewController.swift
//  GuessTheFlagGame
//
//  Created by Mohammad Ashraful Islam Sadi on 30/12/19.
//  Copyright © 2019 Wheels-Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!

    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    
        countries += ["estonia", "france", "germany", "ireland",
                      "italy", "monaco", "nigeria", "poland",
                      "russia", "spain", "uk", "us"]
        scoreLabel.isHidden = true
        commentLabel.isHidden = true
        askQuestion()
        
    }
    
    func askQuestion() {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton){
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            commentLabel.text = "YOU ARE RIGHT!"
            commentLabel.textColor = UIColor.green
            scoreLabel.textColor = UIColor.green
            score += 1
        } else {
            title = "Wrong"
            commentLabel.text = "YOU ARE WRONG!"
            commentLabel.textColor = UIColor.red
            scoreLabel.textColor = UIColor.red
            score -= 1
        }
        
        commentLabel.isHidden = false
        scoreLabel.isHidden = false
        scoreLabel.text = "Your score is: \(score)"
        askQuestion()
        
//        let alertController = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
//        alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
//        present(alertController, animated: true)
    }


}


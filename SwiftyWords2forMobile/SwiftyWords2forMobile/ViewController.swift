//
//  ViewController.swift
//  SwiftyWords2forMobile
//
//  Created by Mohammad Ashraful Islam Sadi on 9/1/20.
//  Copyright © 2020 Wheels-Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cluesLabel: UILabel!
    var answersLabel: UILabel!
    var currentAnswer: UITextField!
    var scoreLabel: UILabel!
    var letterButtons = [UIButton]()
    var activatedButtons = [UIButton]()
    var solutions = [String]()
    var submitButton:UIButton!
    var clearButton:UIButton!
    var buttonsView:UIView!
    var level = 1
    var score = 0 {
        didSet{
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func loadView() {
        
        view = UIView()
        view.backgroundColor = .systemOrange
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.textAlignment = .right
        scoreLabel.textColor = .white
        scoreLabel.text = "Score: 0"
        view.addSubview(scoreLabel)
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 16)
        cluesLabel.text = "CLUES"
        cluesLabel.numberOfLines = 0
        cluesLabel.textColor = .white
        view.addSubview(cluesLabel)
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        
        answersLabel = UILabel()
        answersLabel.translatesAutoresizingMaskIntoConstraints = false
        answersLabel.font = UIFont.systemFont(ofSize: 16)
        answersLabel.text = "ANSWERS"
        answersLabel.numberOfLines = 0
        answersLabel.textAlignment = .right
        answersLabel.textColor = .white
        view.addSubview(answersLabel)
        answersLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        
        currentAnswer = UITextField()
        currentAnswer.translatesAutoresizingMaskIntoConstraints = false
        currentAnswer.placeholder = "Tap the letters to guess"
        currentAnswer.textAlignment = .center
        currentAnswer.font = UIFont.systemFont(ofSize: 20)
        currentAnswer.isUserInteractionEnabled = false
        currentAnswer.textColor = .white
        view.addSubview(currentAnswer)
        
        submitButton = UIButton()
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("SUBMIT", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        clearButton = UIButton()
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("CLEAR", for: .normal)
        clearButton.setTitleColor(UIColor.white, for: .normal)
        view.addSubview(clearButton)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 0),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 1.0, constant:  -100),
            
            answersLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 100),
            answersLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: 0),
            answersLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.55, constant: -100),
            answersLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            currentAnswer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currentAnswer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            currentAnswer.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor, constant: 70),
            
            submitButton.topAnchor.constraint(equalTo: currentAnswer.bottomAnchor, constant: -10),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            
            clearButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            clearButton.centerYAnchor.constraint(equalTo: submitButton.centerYAnchor),
            clearButton.heightAnchor.constraint(equalToConstant: 44),
            
            buttonsView.widthAnchor.constraint(equalToConstant: 350),
            buttonsView.heightAnchor.constraint(equalToConstant: 280),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 10),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
        ])
        
        
//        cluesLabel.backgroundColor = .red
//        answersLabel.backgroundColor = .blue
        //buttonsView.backgroundColor = .green
        //currentAnswer.backgroundColor = .systemPink
        
        
        //Set some values for the width and height of each button
        let width = 70
        let height = 60
        
        //create 20 buttons as a 4x5 grid
        for row in 0..<4 {
            for column in 0..<5 {
                
                //create a new button and give it a big font size
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
                
                //give the button some temporary text so we can see it on screen
                letterButton.setTitle("WWW", for: .normal)
                
                //calculate the frame of this button using its column and row
                let frame = CGRect(x: (column*width), y: ((row*height) + 20) , width: width, height: height)
                letterButton.frame = frame
                
                //add it to the buttons view
                buttonsView.addSubview(letterButton)
                
                //and also to our letter buttons array
                letterButtons.append(letterButton)
                letterButton.addTarget(self, action: #selector(letterButtonTapped), for: .touchUpInside)
                letterButton.setTitleColor(UIColor.white, for: .normal)
            }
        }
        
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scoreLabel.alpha = 0
        cluesLabel.alpha = 0
        answersLabel.alpha = 0
        currentAnswer.alpha = 0
        submitButton.alpha = 0
        clearButton.alpha = 0
        buttonsView.alpha = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let scale = UIViewPropertyAnimator(duration: 0.85, curve: .easeIn)
        scale.addAnimations {
            self.scoreLabel.alpha = 1
            self.cluesLabel.alpha = 1
            self.answersLabel.alpha = 1
            self.currentAnswer.alpha = 1
            self.submitButton.alpha = 1
            self.clearButton.alpha = 1
            self.buttonsView.alpha = 1
        }
        
        scale.addAnimations({
            self.scoreLabel.transform = CGAffineTransform.identity
            self.cluesLabel.transform = CGAffineTransform.identity
            self.answersLabel.transform = CGAffineTransform.identity
            self.currentAnswer.transform = CGAffineTransform.identity
            self.submitButton.transform = CGAffineTransform.identity
            self.clearButton.transform = CGAffineTransform.identity
            self.buttonsView.transform = CGAffineTransform.identity
            
        }, delayFactor: 0.30)
        
        scale.startAnimation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadLevel()
    }
    
    func loadLevel(){
        var clueString = ""
        var solutionString = ""
        var letterBits = [String]()
        
        if let levelFileURL = Bundle.main.url(forResource: "level\(level)", withExtension: ".txt") {
            if let levelContents = try? String(contentsOf: levelFileURL) {
                var lines = levelContents.components(separatedBy: "\n")
                lines.shuffle()
                for (index, line) in lines.enumerated(){
                    let parts = line.components(separatedBy: ": ")
                    let answer = parts[0]
                    let clue = parts[1]
                    clueString += "\(index + 1). \(clue)\n"
                    let solutionWord = answer.replacingOccurrences(of: "|", with: "")
                    solutionString += "\(solutionWord.count) letters\n"
                    solutions.append(solutionWord)
                    let bits = answer.components(separatedBy: "|")
                    letterBits += bits
                    
//                    print("index: \(index),\n line: \(line),\n parts: \(parts),\n answer: \(answer),\n clue: \(clue),\n clueString: \(clueString),\n solutionWord: \(solutionWord),\n solutionString:                         \(solutionString),\n solutions: \(solutions),\n bits: \(bits),\n letterBits: \(letterBits)")
                    
                }
            }
        }
        
        //Now configure the buttons and labels
        cluesLabel.text = clueString.trimmingCharacters(in: .whitespacesAndNewlines)
        answersLabel.text = solutionString.trimmingCharacters(in: .whitespacesAndNewlines)
        letterBits.shuffle()
        if letterBits.count == letterBits.count {
            for i in 0..<letterButtons.count {
                letterButtons[i].setTitle(letterBits[i], for: .normal)
            }
        }
    }
    
    @objc func letterButtonTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        sender.isHidden = true
        
    }
    
    @objc func submitButtonTapped(_ sender: UIButton){
        guard let answerText = currentAnswer.text else {return}
        if let solutionPosition = solutions.firstIndex(of: answerText){
            activatedButtons.removeAll()
//            print("ANSWERSLABEL.TEXT: \(String(describing: answersLabel.text))")
            var splitAnswers = answersLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solutionPosition] = answerText
            answersLabel.text = splitAnswers?.joined(separator: "\n")
            currentAnswer.text = ""
            score += 1
//            print("answerText: \(answerText)\n solutionPosition: \(solutionPosition)\n activatedButtons: \(activatedButtons)\n splitAnswers: \(String(describing:                     splitAnswers))\n answersLabel.text: \(String(describing: answersLabel.text))")
            if score%7 == 0 {
                let alertController = UIAlertController(title: "Well done!", message: "Are you ready for the next level?", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "let's go!", style: .default, handler: levelUp))
                present(alertController, animated: true)
            }
        }
    }
    
    @objc func clearButtonTapped(_ sender: UIButton) {
        currentAnswer.text = ""
        for button in activatedButtons {
            button.isHidden = false
        }
        activatedButtons.removeAll()
    }

    func levelUp(action: UIAlertAction){
        level += 1
        solutions.removeAll(keepingCapacity: true)
        loadLevel()
        for button in letterButtons {
            button.isHidden = false
        }
    }
    
    
}


//
//  ViewController.swift
//  QuizApp
//
//  Created by Rajib on 28/6/20.
//  Copyright © 2020 Rajib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    lazy var quizzes = game.quizArr
    lazy var currentQuiz = quizzes[currentQuizIndex]
    
    var questionQuantity = 5
    var tappedAnswer = -1
    var currentScore = 0 {
        didSet{
            scoreLabel.text = "Score: " + String(currentScore)
        }
    }
    
    @IBOutlet var appSubtitle: UILabel!
    @IBOutlet var orderLabels: [UILabel]!
    @IBOutlet var answerContainer: [UIView]!
    @IBOutlet var scoreContainer: UIView!
    @IBOutlet var submitButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: [UILabel]!
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    
    @IBAction func submitPressed(sender: UIButton){
        if tappedAnswer == currentQuiz.correctAnswerIndex{
            print("answer is correct, proceed to next qusiton")
            currentScore += 1
        }
        
        currentQuizIndex += 1
    }
    
    var currentQuizIndex = 0{
        didSet{
            if currentQuizIndex == questionQuantity{
                gameEnd()
            }else{
                currentQuiz = quizzes[currentQuizIndex]
                updateUIWithContent()
                quizNumberLabel.text = "Quiz: \(currentQuizIndex)"
            }
            
        }
    }
    
 
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.createQuestion(quantity: questionQuantity)
        updateUIWithContent()
        
        // add bottom border in subtitle
        let bounds: CGRect = appSubtitle.bounds
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: ([.bottomLeft, .bottomRight]), cornerRadii: CGSize(width: 25.0, height: 25.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        appSubtitle.layer.mask = maskLayer
        
        // make order abcd lable rounded
        for orderLabel in orderLabels{
            orderLabel.layer.cornerRadius = orderLabel.bounds.width / 2
            orderLabel.layer.masksToBounds = true
        }

        // make all answer lable rounded and add tap gesture recognizer
        for answerBox in answerContainer{
            answerBox.layer.cornerRadius = 30.0
            answerBox.layer.masksToBounds = true
            answerBox.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(answerTapped(sender:))) )
            
        }
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: scoreContainer.frame.height, width: scoreContainer.frame.width, height: 1.0)
        bottomBorder.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scoreContainer.layer.addSublayer(bottomBorder)
        
        submitButton.layer.cornerRadius =  15.0
        submitButton.layer.masksToBounds = true
        
    }
    
    @objc func answerTapped(sender: UITapGestureRecognizer ){
        let answerBox = sender.view!
        tappedAnswer = answerContainer.firstIndex(of: answerBox)!
        //reset all background color
        answerBox.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
    }
    
    func resetAnswerboxesBg(){
        for ansBox in answerContainer{
            ansBox.backgroundColor = #colorLiteral(red: 0.8202039599, green: 0.8803991675, blue: 0.9178293347, alpha: 1)
        }
    }
    
    func gameEnd(){
        
        let alert = UIAlertController(title: "Quiz End!", message: " Your score is \(currentScore) out of \(questionQuantity) ", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart the Quiz", style: .default) { (UIAlertAction) in
            self.currentQuizIndex = 0
            self.currentScore = 0
        }
        
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
    
    
    
    func updateUIWithContent(){
        questionLabel.text = currentQuiz.question
        var temp = 0
        for answerLabel in answerLabel{
            answerLabel.text = currentQuiz.answers[temp]
            temp += 1
        }
        
        resetAnswerboxesBg()
    }
   
    
    
    

}


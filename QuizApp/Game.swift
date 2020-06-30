//
//  Game.swift
//  QuizApp
//
//  Created by Rajib on 28/6/20.
//  Copyright © 2020 Rajib. All rights reserved.
//

import UIKit


class Game{
    var quizArr : [Quiz] = []
    
    @discardableResult
    func createQuestion(quantity: Int) -> [Quiz]{
        for i in 0..<quantity{
            if i % 2 == 0 {
                let newQuiz = Quiz(question: "What is the capital of Singapore?", answers: ["Jalan Basir", "Little India", "Ferrer Park", "Singapore"], correctAnswerIndex: 3)
                 quizArr.append(newQuiz)
            }else{
                let newQuiz = Quiz(question: "What is the capital of Bangladesh?", answers: ["Rajshahi", "Dhaka", "Rangpur", "Gazipur"], correctAnswerIndex: 1)
                 quizArr.append(newQuiz)
            }
            
           
        }
        
        return quizArr
    }
}

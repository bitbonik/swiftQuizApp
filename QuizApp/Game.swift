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
    var currentQuiz = 0
    
    @discardableResult
    func createQuestion(quantity: Int) -> [Quiz]{
        for _ in 0..<quantity{
            let newQuiz = Quiz(question: "What is the capital of Bangladesh", answers: ["Rajshahi", "Dhaka", "Rangpur", "Gazipur"], correctAnswerIndex: 1)
            quizArr.append(newQuiz)
        }
        
        return quizArr
    }
}

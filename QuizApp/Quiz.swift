//
//  Quiz.swift
//  QuizApp
//
//  Created by Rajib on 28/6/20.
//  Copyright © 2020 Rajib. All rights reserved.
//

import UIKit


class Quiz{
    var question: String
    var answers: [String]
    var correctAnswerIndex: Int
    
    init(question: String, answers: [String], correctAnswerIndex: Int){
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
}

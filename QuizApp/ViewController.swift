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
    var questionQuantity = 5
    
     @IBOutlet var appSubtitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        game.createQuestion(quantity: questionQuantity)
//        appSubtitle.layer.cornerRadius = 20.0
//        appSubtitle.layer.masksToBounds = true
        
        let bounds: CGRect = appSubtitle.bounds
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: ([.bottomLeft, .bottomRight]), cornerRadii: CGSize(width: 25.0, height: 25.0))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        appSubtitle.layer.mask = maskLayer
    }
    
   
    
    
    

}


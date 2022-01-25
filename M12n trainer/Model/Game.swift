//
//  Game.swift
//  M12n trainer
//
//  Created by Afir Thes on 25.01.2022.
//

import Foundation


struct Question {
    let x:Int
    let y:Int
    var answers:[Int]
    var answer:Int?
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        answers = []
        answers.append(x*y)
        answers.append(Int.random(in: x*y-100...x*y+100))
        answers.append(Int.random(in: x*y-100...x*y+100))
        answers.append(Int.random(in: x*y-100...x*y+100))
        answers.shuffle()
    }
}

class Game {
    
    static let QUESTIONS_IN_GAME = 5;
    
    var questions:[Question]
    
    static var current: Game?
    
    init() {
        questions = []
        for _ in 0...Game.QUESTIONS_IN_GAME {
            questions.append(Question(x: Int.random(in: 0...99), y: Int.random(in: 0...99)))
        }
    }
    
    
    
}

//
//  Game.swift
//  M12n trainer
//
//  Created by Afir Thes on 25.01.2022.
//

import Foundation


struct Question {
    
    
    struct Answer {
        let value:Int
        let isCorrect:Bool
    }
    
    let x:Int
    let y:Int
    var answers:[Answer]
    var answer:Answer?
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
        answers = []
        answers.append( Answer(value: x*y, isCorrect: true) )
        // x*(y + 2), (x+1|2|3 * y)
        // четное-нечетное
        // отрицательное и ноль
        answers.append(Answer(value: getRandomNumber(), isCorrect: false))
        answers.append(Answer(value: getRandomNumber(), isCorrect: false))
        answers.append(Answer(value: getRandomNumber(), isCorrect: false))

        answers.shuffle()
    }
    
    func getRandomNumber() -> Int {
        return Int.random(in: x*y-100...x*y+100)
    }
}

class Game {
    
    static let QUESTIONS_IN_GAME = 5;
    
    var questions:[Question]
    
    init() {
        questions = []
        for _ in 0...Game.QUESTIONS_IN_GAME {
            questions.append(Question(x: Int.random(in: 0...99), y: Int.random(in: 0...99)))
        }
    }
    
    
    
}

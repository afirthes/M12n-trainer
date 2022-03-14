//
//  Game.swift
//  M12n trainer
//
//  Created by Afir Thes on 25.01.2022.
//

import Foundation

struct Answer: CustomStringConvertible {
    let value:Int
    let isCorrect:Bool
    
    var description: String {
        "\(value). It's \(isCorrect ? "" : "not") correct"
    }
}

struct Question: CustomStringConvertible {
    let x:Int
    let y:Int
    var answers:[Answer]
   
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
    
    var description: String {
        "\(x) * \(y) = \(x*y)"
    }
}

class QuestionStatistics: CustomStringConvertible {
   
    var question: Question
    var answer: Answer
    var time: Double
    
    init(question: Question, answer: Answer, time: Double) {
        self.question = question
        self.answer = answer
        self.time = time
    }
    
    var description: String {
        "Question: \(question)\nAnswer: \(answer)\nTime: \(time)"
    }
}

class GameStatistics: CustomStringConvertible {
    
    let id = UUID().uuidString
    let creationDate = Date()
    var questions: [QuestionStatistics]
    
    init(questions: [QuestionStatistics]) {
        self.questions = questions
    }
    
    var description: String {
        questions.map { $0.description }.joined(separator: "\n")
    }
}

class Game {
    
    static let QUESTIONS_IN_GAME = 5;
    
    var questions: [Question]
    var statistics: GameStatistics
    
    init() {
        questions = []
        statistics = GameStatistics(questions: [])
        for _ in 0...Game.QUESTIONS_IN_GAME {
            questions.append(Question(x: Int.random(in: 0...99), y: Int.random(in: 0...99)))
        }
    }
    
    func registerAnswer(question: Question, answer: Answer, time: Double) {
        let questionStats = QuestionStatistics(question: question, answer: answer, time: time)
        statistics.questions.append(questionStats)
    }
    
}

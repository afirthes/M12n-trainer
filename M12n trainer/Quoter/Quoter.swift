//
//  Quoter.swift
//  M12n trainer
//
//  Created by Afir Thes on 01.02.2022.
//

import Foundation


class Quoter {
    
    struct Quote {
        let text:String
        let author:String
    }
    
    let quotesCount = 3
    
    static let shared = Quoter()
    
    let quotes:[Quote]

    private init() {
        var qs = Array<Quote>()
        for i in 0..<quotesCount {
            let phrase = NSLocalizedString("phrase\(i)", comment: "")
            let author = NSLocalizedString("author\(i)", comment: "")
            qs.append(Quote(text: phrase, author: author))
        }
        self.quotes = qs
    }
    
    func random() -> Quote {
        return self.quotes.randomElement()!
    }
    
}

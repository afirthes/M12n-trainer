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
    
    static let shared = Quoter()
    
    let quotes:[Quote]

    private init() {
        var qs = Array<Quote>()
        var index = 0
    
        while index >= 0 {
            let phraseKey = "phrase\(index)"
            let authorKey = "author\(index)"
            let phrase = NSLocalizedString(phraseKey, comment: "")
            let author = NSLocalizedString(authorKey, comment: "")
            
            if phrase == phraseKey || author == authorKey {
                index = -1
            } else {
                qs.append(Quote(text: phrase, author: author))
                index += 1
            }
        }
        self.quotes = qs
    }
    
    func random() -> Quote {
        return self.quotes.randomElement()!
    }
    
}

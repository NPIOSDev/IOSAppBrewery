//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Nelson on 2/8/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let quiz: String
    let answer: String
    
    init(q: String, a: String) {
        self.quiz = q
        self.answer = a
    }
}

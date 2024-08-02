//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Nelson on 2/8/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    static var _quizBrain: QuizBrain?
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    static var shared: QuizBrain {
        if let brain = QuizBrain._quizBrain {
            return brain
        }
        
        QuizBrain._quizBrain = QuizBrain()
        return QuizBrain._quizBrain!
    }
    
    var questionNumber: Int = 0
    var userScore: Int = 0
    
    var currentQuestion: Question {
        return quiz[questionNumber]
    }
    
    var quizProgress: Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    var currentQuestionNumber: Int {
        return questionNumber
    }
    
    var totalQuiz: Int {
        return quiz.count
    }
    
    var score: Int {
        return userScore
    }
    
    mutating func checkAnswer(_ answer:String) -> Bool {
        let question = quiz[questionNumber]
        let validation = question.correctAnswer == answer
        
        if validation {
            userScore += 1
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            userScore = 0
        }
        
        return validation
    }
}

//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Nelson on 7/8/2024.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.green
    }
    
    mutating func calculateBMI(height:Float, weight:Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat more food!", color: UIColor.cyan)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Exellent!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Gotta get in shap!", color: UIColor.red)
        }
    }
}

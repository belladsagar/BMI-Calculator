//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Sagar c bellad on 31/03/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//


import UIKit

struct calculatorBrain{
    var bmi : BMI?
    mutating func calculateBmi(height: Float,weight: Float){
        let bmiValue = (weight)/pow(height,2)
        if(bmiValue < 18.5){
            bmi = BMI(value: bmiValue, advice: "Eat more", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if (bmiValue < 24.9){
            bmi = BMI(value: bmiValue, advice: "Fit", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }
        else{
            bmi = BMI(value: bmiValue, advice: "Eat less", color: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
        }
       // bmi = BMI(value: getBmiValue(), advice: , color: <#T##UIColor#>)
    }
    
    func getBmiValue() ->String{
        if(bmi != nil){
            let bmiTo1DecimalPlaces = String(format: "%.1f",bmi?.value ?? 0.0)
            return(bmiTo1DecimalPlaces)
        }
        else{
            return("0.0")
        }
    }
    
    func getAdvice() -> String{
    return bmi?.advice ?? "No Advice!"
    }
    
    func getColor() ->UIColor{
        return bmi?.color ?? UIColor.white
    }
}

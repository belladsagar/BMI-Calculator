//
//  ViewController.swift
//  BMI Calculator
//
//  Created by SAGAR C BELLAD on 25/03/2020.
//  Copyright © 2019 SAGAR C BELLAD. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculateBrainObject = calculatorBrain()
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightValue.text = String(format: "%.2f",sender.value)+"m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightValue.text = String(format: "%.0f",sender.value)+"Kg"
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculateBrainObject.calculateBmi(height: height, weight: weight)
        //print(String(format: "%.2f",bmi)+"Kg/m^2")
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController  //This contains the address of the destination
            destinationVC.bmiValue = calculateBrainObject.getBmiValue()
            destinationVC.advice = calculateBrainObject.getAdvice()
            destinationVC.color = calculateBrainObject.getColor()
        }
    }
}


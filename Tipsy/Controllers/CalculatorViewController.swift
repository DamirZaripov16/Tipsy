//
//  ViewController.swift
//  Tipsy
//
//  Created by Damir Zaripov on 25.04.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var splitValue = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
        
        switch sender {
        case zeroPctButton:
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        case tenPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        case twentyPctButton:
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        default:
            break
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = "\(Int(sender.value))"

    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text ?? "0"
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(splitValue)
            finalResult = String(format: "%.2f", result)
        }
                
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = splitValue
        }
    }
    
}


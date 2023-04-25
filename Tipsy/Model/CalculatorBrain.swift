//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Damir Zaripov on 25.04.2023.
//

import UIKit

struct CalculatorBrain {
    
    var bill: Bill?
    
    mutating func calculateTotalBill(bill: Double, tip: Double, split: Double) {
        
        let totalValue = (bill + (bill * tip)) / split
        
        bill = Bill(bill: <#T##Double#>, tip: <#T##Double#>, split: <#T##Double#>)
    }
    
    func getTotalBill() -> String {
        
        let totalValue = String(format: "%.2f", bill?.value ?? 0.0)
        
    }
}

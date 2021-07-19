//
//  TipBrain.swift
//  Tip Calculator
//
//  Created by MacBook on 18.07.2021.
//

import UIKit

struct TipBrain {
    var tipPercent: Float = 0
    var totalTip: Float = 0
    
    mutating func calculateTip(_ percent: String) {
        switch percent {
        case "0%":
            tipPercent = 0.0
        case "10%":
            tipPercent = 0.1
        default:
            tipPercent = 0.2
        }
    }
    mutating func getPersonAndBill(_ person: Int, _ bill: Int) {
        
        totalTip = (Float(bill) * tipPercent) / Float(person)
        print("Total per person: \(String(format: "%.0f", totalTip))")
        
    }
    
    
    
    
}

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
    let person = 1
    
    mutating func percentCalculation(_ percent: String) {
        switch percent {
        case "0%":
            tipPercent = 0.0
        case "10%":
            tipPercent = 0.1
        default:
            tipPercent = 0.2
        }
    }
    // tip calculation
    mutating func tipCalculation(_ person: Int, _ bill: Int) {
        
        totalTip = (Float(bill) * tipPercent) / Float(person)
       
        
    }
    mutating func getTip() -> String {
        let tip = "Total per person: \(String(format: "%.0f", totalTip))"
        return tip

    }
    
    mutating func getReport() -> String {
        let report = "Split between \(person), with \(tipPercent) percent tip"
        return report
    }
    
    
}

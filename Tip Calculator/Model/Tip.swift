//
//  Tip.swift
//  Tip Calculator
//
//  Created by MacBook on 18.07.2021.
//

import Foundation

struct Trip {
    let percent: Float
    let person: Int
    let bill: Int
    
    init(percent: Float, person: Int, bill: Int) {
        self.percent = percent
        self.person = person
        self.bill = bill
    }
}

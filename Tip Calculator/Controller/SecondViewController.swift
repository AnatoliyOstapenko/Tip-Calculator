//
//  SecondViewController.swift
//  Tip Calculator
//
//  Created by MacBook on 18.07.2021.
//

import UIKit

class SecondViewController: ViewController {
    var total: String?
    var report: String?
    
    
    @IBOutlet weak var tipPerPersonLabel: UILabel!
    @IBOutlet weak var resume: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // showing total and report from prepare function in ViewController class
        tipPerPersonLabel.text = total
        resume.text = report
        
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        
        // segue sends back to ViewController
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
}

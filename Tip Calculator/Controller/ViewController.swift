//
//  ViewController.swift
//  Tip Calculator
//
//  Created by MacBook on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tipBrain = TipBrain()
    //set 1 person, in case 0 was set, the getPersonAndBill function crashes
    var person = 1
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set delegate to use func textFieldShouldReturn
        if billTextField != nil {
            billTextField.delegate = self
        } else {
            return
        }
        
        
    }
    
    
    @IBAction func percentButtonPressed(_ sender: UIButton) {
        //triggered function to clear border color and highlight pressed button
        borderColor(sender)
        // unwrapping percent button before transmitting
        guard let choosenButton = sender.currentTitle else {
            return
        }
        tipBrain.percentCalculation(choosenButton)
        
    }
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        person = Int(sender.value)
        
        //transfer value from stepper to label
        //description for textual representation of this value.
        personLabel.text = Int(person).description
        
        // hide keyboard when stepper pressed
        billTextField.endEditing(true)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        //first of all I had to unwrap optional billTextField to use it further
        guard let textField = billTextField.text else {
            return
        }
        // converted value to Int. condition to transfer value textField to func getPersonAndBill
        if let bill = Int(textField) {
            tipBrain.tipCalculation(person, bill)
        } else {
            // clear text field if user types wrong
            billTextField.text = ""
        }
        
        // segue to show a next related "SecondViewController" on screen
        self.performSegue(withIdentifier: "goToSecondView", sender: self)
        
        
    }
    // set border and a color for tip buttons to have ability to see which button pressed
    func borderColor(_ button: UIButton) {
        // deselected buttons - clear border color
        zeroButton.layer.borderColor = UIColor.clear.cgColor
        tenButton.layer.borderColor = UIColor.clear.cgColor
        twentyButton.layer.borderColor = UIColor.clear.cgColor
        
        
        // set choosen button with cyan border color
        button.layer.borderColor = UIColor.cyan.cgColor
        button.layer.borderWidth = 6
    }
    
    // this function is needed to transmited information from ViewController to SecondViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // check if I choose the right path (from ViewController to SecondViewController)
        
        if segue.identifier == "goToSecondView" {
            
            let destinationSVC = segue.destination as! SecondViewController
            //transferring variables total and report from TipBrain struct to SecondViewController class
            destinationSVC.total = tipBrain.getTip()
            destinationSVC.report = tipBrain.getReport()
            
        }
        
        
    }
    
}

  
        

// extension to dismiss keyboard (workink with delegate in view didload only)
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

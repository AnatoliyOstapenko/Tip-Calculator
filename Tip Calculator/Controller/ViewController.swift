//
//  ViewController.swift
//  Tip Calculator
//
//  Created by MacBook on 18.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tipBrain = TipBrain()
    var person = 0
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set delegate to use func textFieldShouldReturn
        billTextField.delegate = self
        
    }
    

    @IBAction func precentButtonPressed(_ sender: UIButton) {
        borderColor(sender)
        guard let choosenButton = sender.currentTitle else {
            return
        }
        tipBrain.calculateTip(choosenButton)
        
        
        
        
        
    }
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        //first of all I had to unwrap optional billTextField to ues further
        guard let textField = billTextField.text else {
            return
        }
        // unwrapping textFielt to transfer value textField to func getPersonAndBill
        if let bill = Int(textField) {
            tipBrain.getPersonAndBill(person, bill)
        } else {
            // clear text field if user types wrong
            billTextField.text = ""
        }
        
        
        
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        
        person = Int(sender.value)
        
        //transfer value from stepper to label
        //description for textual representation of this value.
        personLabel.text = Int(person).description
        
        // hide keyboard when stpper pressed
        billTextField.endEditing(true)
        
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
    
    
    

}
// extension to dismiss keyboard (workink with delegate in  view didload only
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

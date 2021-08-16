//
//  ViewController.swift
//  Prework
//
//  Created by Minh Hanh on 11/08/2021.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipSliderlabel: UILabel!
    @IBOutlet weak var sliderView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        billAmountTextField.becomeFirstResponder()
    }
    
    
    @IBAction func switchToSlider(_ sender: Any) {
        if (Switch.isOn){
            sliderView.isHidden = false
        }
        if (Switch.isOn == false){
            sliderView.isHidden = true
        }
    }
    
    func updateLabel(_ tip: Double, _ total: Double){
        // Update Tip Amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update Total label
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field inpute
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        updateLabel(tip, total)
    }
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        tipSliderlabel.text = String(format: "%.2f", tipSlider.value*100) + "%"
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentage = Double(tipSlider.value)
        let tip = bill * tipPercentage
        let total = tip + bill
        
        updateLabel(tip, total)
    }
}


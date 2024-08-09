//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var total: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
    }
    
    func tipTextToNumber(_ tipText:String?) -> Float? {
        if let safeTip = tipText {
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            
            let tip = formatter.number(from: safeTip)?.floatValue ?? 0.0
            return tip
        }
        
        return nil
    }
    
    func getTip() -> Float {
        var tip: Float
        
        if zeroPctButton.isSelected{
            tip = tipTextToNumber(zeroPctButton.titleLabel?.text) ?? 0.0
        } else if tenPctButton.isSelected {
            tip = tipTextToNumber(tenPctButton.titleLabel?.text) ?? 0.0
        } else {
            tip = tipTextToNumber(twentyPctButton.titleLabel?.text) ?? 0.0
        }
        
        return tip
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard billTextField.text != nil && !billTextField.text!.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Enter bill", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
            return
        }
        
        if let safeBillText = billTextField.text {
            let bill = Float(safeBillText)!
            let split = Float(splitNumberLabel.text!)!
            let tip = getTip()
            
            total = (bill + bill * tip) / split
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ResultViewController
        
        
        destVC.total = String(format: "%.2f", total ?? 0.0)
        if zeroPctButton.isSelected{
            destVC.tip = (zeroPctButton.titleLabel?.text)!
        } else if tenPctButton.isSelected {
            destVC.tip = (tenPctButton.titleLabel?.text)!
        } else {
            destVC.tip = (twentyPctButton.titleLabel?.text)!
        }
        destVC.numberOfPeople = splitNumberLabel.text!
    }
}


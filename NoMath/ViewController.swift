//
//  ViewController.swift
//  NoMath
//
//  Created by Mike Jacobs on 5/1/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipView: UIView!
    var firstRun = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.text = "$"
        billField.becomeFirstResponder()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
    
    @IBAction func onBillChanged(sender: AnyObject) {
        if(firstRun){
            println("first")
            firstRun = false
            UIView.animateWithDuration(0.3, animations: {
                
                self.tipView.frame = CGRect(x: self.tipView.frame.origin.x, y: self.tipView.frame.origin.y - 20, width: self.tipView.frame.width, height: self.tipView.frame.height)
                self.tipView.alpha = 1
                
                }, completion: nil)
        }
        
        
        var tipPercentages = [0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billString = ""
        var billAmount: Double = 0.0
        var tip: Double = 0.0
        var total: Double = 0.0
        
//      if text isn't just a dollar sign
        if(countElements(billField.text) > 1){
            
            billString = billField.text.substringFromIndex(advance(billField.text.startIndex,1))
            var billAmount : Double = NSString(string: billString).doubleValue
            tip = billAmount * tipPercentage
            total = billAmount + tip
            
        }
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        billField.text = "$\(billString)"
    }
    
    @IBAction func onTapView(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


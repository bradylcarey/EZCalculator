//
//  ViewController.swift
//  EZCalculator
//
//  Created by Brady Carey on 1/28/15.
//  Copyright (c) 2015 divms. All rights reserved.
//
//

import UIKit


extension Double {
    func string() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 12
        return formatter.string(from: NSNumber(value: self))!
    }
}


extension String {
    func doubleValue() -> Double {
        return (self as NSString).doubleValue
    }
}

//////////

class ViewController: UIViewController {
    
    var userIsInMiddleOfEnteringANumber:Bool = false
    var model:CalculatorModel = CalculatorModel()

    @IBOutlet weak var theDisplay: UILabel!
    @IBOutlet weak var modelText: UILabel!
    
    @IBAction func enterPressed() {
        print("Enter pressed")
        
        modelText.text = modelText.text! + theDisplay.text! + "  "
        userIsInMiddleOfEnteringANumber = false
        let numberToSend:Double = theDisplay.text!.doubleValue()
        model.numberEntered(numberToSend)
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        print("Clear Pressed")
        NSLog("Clear Pressed")
        
        userIsInMiddleOfEnteringANumber = false
        modelText.text = ""
        theDisplay.text = "0"
        model.clearEntered()
        
    }
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        if userIsInMiddleOfEnteringANumber {
            enterPressed()
        }
        
        modelText.text = modelText.text! + sender.currentTitle! + "  "
        let op:String = sender.currentTitle!
        NSLog("Operation pressed %@", op)
        
        let result:Double = model.performOperation(op)
        NSLog("Operation result: %f", result)
        
        let resultString:String = result.string()
        theDisplay.text = String(resultString)
    }
    
    
    @IBAction func piPressed(_ sender: UIButton) {
        print("Pi Pressed")
        NSLog("Pi pressed")
        
        var result:Double = theDisplay.text!.doubleValue()
        
        if result == 0.00{
            result = M_PI
        }else{
            result = result * M_PI
        }
        theDisplay.text = result.string()
        
    }
    
    @IBAction func specialPressed(_ sender: UIButton) {
        var resultString:String
        
        print("Character Pressed: \(sender.currentTitle!)")
        
        let char:String = sender.currentTitle!
        NSLog("Operation pressed %@", char)
        
        var result:Double = model.performSpecial(char)
        NSLog("Special result: %f", result)
        
        if result != 0.00{
            resultString = result.string()
        }else{
            resultString = theDisplay.text!
        }
        theDisplay.text = String(resultString)
        
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        print("Digit pressed: \(sender.currentTitle!)")
        
        if userIsInMiddleOfEnteringANumber {
            theDisplay.text = theDisplay.text! + sender.currentTitle!
        } else {
            theDisplay.text = sender.currentTitle!
            userIsInMiddleOfEnteringANumber = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}




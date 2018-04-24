//
//  CalculatorModel.swift
//
//  Created by Brady Carey on 1/29/15.
//
//

import Foundation

class CalculatorModel {
    
    var stack: Array<Double>
    
    init() {
        stack = []
    }
    
    fileprivate func pushOntoStack(_ item:Double) -> () {
        stack.append(item)
        NSLog("Current stack: %@", stack)
    }
    
    fileprivate func popStack() -> Double {
        if stack.count > 0 {
            let topItem:Double = stack.last!
            stack.removeLast()
            return topItem
        } else {
            return 0.0
        }
    }
    
    func clearEntered(){
        while stack.count > 0{
            stack.removeLast()
        }
    }
    
    func numberEntered(_ number:Double) -> () {
        pushOntoStack(number)
    }
    
    func performSpecial(_ char:String) -> Double {
        
        if stack.count > 0{
            var result:Double = stack.removeLast()
        
            switch char{
            case "Sin":
                result = sin(result)
                pushOntoStack(result)
            case "Cos":
                result = cos(result)
                pushOntoStack(result)
            case "Sqrt":
                result = sqrt(result)
                pushOntoStack(result)
            default:
                pushOntoStack(result)
            }
            return result
        }else{
            print("No Item on Stack")
            return 0.00
        }
        
    }
    
    
    func performOperation(_ op:String) -> Double {
        var result:Double
        
        let op2:Double = popStack()
        let op1:Double = popStack()
        
        switch op {
        case "+":
            result = op1 + op2
        case "-":
            result = op2 - op1
        case "*":
            result = op1 * op2
        case "/":
            result = op1 / op2
        default:
            print("Error: performOperation given undefined operation")
            result = 0.0
        }
        pushOntoStack(result)
        NSLog("Current stack: %@", stack)
        
        return result
    }
}

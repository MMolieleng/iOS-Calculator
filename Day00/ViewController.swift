//
//  ViewController.swift
//  Day00
//
//  Created by Mohale MOLIELENG on 2017/10/03.
//  Copyright © 2017 Mohale MOLIELENG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayView: UILabel!
    
    var leftString: String = "0"
    var rightString: String = "0"
    
    var operation: String = ""
    var isRight: Bool = false
    var isSigned: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getInput(_ sender: UIButton){
    
        var input: String = ""
        switch sender.tag {
        case 1:
            input = "1"
            break
        case 2:
            input = "2"
            break
        case 3:
            input = "3"
            break
        case 4:
            input = "4"
            break
        case 5:
            input = "5"
            break
        case 6:
            input = "6"
            break
        case 7:
            input = "7"
            break
        case 8:
            input = "8"
            break
        case 9:
            input = "9"
            break
        case 0:
            input = "0"
            break
        default:
            break
        }
        
        if isRight{
            if rightString != "0"
            {
                let tempVal = Int.addWithOverflow(Int(rightString)!, 0)
                
                if tempVal.overflow{
                    displayView.text = "Error(length)"
                    rightString = "0"
                    return
                }
                else{
                    rightString += input
                    displayView.text = rightString
                }
            }
            else
            {
                let tempVal = Int.addWithOverflow(Int(rightString)!, 0)
                
                if tempVal.overflow{
                    displayView.text = "Error(length)"
                    rightString = "0"
                    return
                }
                else{
                    rightString = input
                    displayView.text = rightString
                }
            }
        }
        else
        {
            if leftString != "0"
            {
                let tempVal = Int.addWithOverflow(Int(leftString)!, 0)
                
                if tempVal.overflow{
                    displayView.text = "Error(Big Number)"
                    leftString = "0"
                    return
                }
                else{
                    leftString += input
                    displayView.text = leftString
                }
            }
            else
            {
                let tempVal = Int.addWithOverflow(Int(leftString)!, 0)
                
                if tempVal.overflow{
                    displayView.text = "Error(Big Number)"
                    leftString = "0"
                    return
                }
                else{
                    leftString = input
                    displayView.text = leftString
                }
            }
        }
    }
    
    @IBAction func getOperation(sender: UIButton){
        
        operation = sender.title(for: .normal)!
        if (leftString != "0"){
            isRight = true
        }else{
            isRight = false
        }
        displayView.text = operation
        print("In Operation")
        rightString = "0"
    }
    
    @IBAction func negativeHandler(_ sender: Any) {
        
        isSigned = !isSigned
        
        if isSigned{
            
            switch isRight {
            
                case true:
                    rightString = "-"+rightString
                    displayView.text = rightString
                    break
                
                case false:
                    leftString = "-"+leftString
                    displayView.text = leftString
                    break
        
            }
        }
        else{
            switch isRight {
                
            case true:
                rightString.remove(at: rightString.startIndex)
                displayView.text = rightString
                break
                
            case false:
                leftString.remove(at: leftString.startIndex)
                displayView.text = leftString
                break
            }
        }
        updateDisplay();
        print("Negative clicked")
    }
    
    @IBAction func resetEverything(_ sender: UIButton) {
        
        isRight = false
        leftString = ""
        rightString = ""
        displayView.text = ""
    }
    
    func updateDisplay(){
        
        if (isRight){
            displayView.text = rightString
        }
        else{
            displayView.text = leftString
        }
    }
    
    @IBAction func calcultateAction(_ sender: UIButton) {
        
        var result: Int = 0
        var error = false
        
        guard let num1 = Int(leftString) else {
            print("Conversiotn failed")
            return
        }
        
        guard let num2 = Int(rightString) else {
            print("Right Convertion Error\(rightString)")
            return
        }
        
        if (operation == "+"){
            result = num1 &+ num2
        }
        else if (operation == "-"){
            result = num1 &- num2
        }
        else if (operation == "*"){
            result = num1 &* num2
        }
        else if (operation == "/"){
            if (num2 == 0){
                error = true
            }
            else{
                result = num1 / num2
            }
        }
        
        if (error){
            displayView.text = "Error"
        }
        else{
            displayView.text = String(result)
        }
        rightString = "0"
        leftString = "0"
        isRight = false
        isSigned = false
        
    }
    
}


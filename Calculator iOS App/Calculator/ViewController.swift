//
//  ViewController.swift
//  Calculator
//
//  Created by Deepak Sudagoni on 4/26/16.
//  Copyright © 2016 Dinesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var typing = false
    var firstNumber:Int? = 0
    var secondNumber:Int? = 0
    var operation:String? = ""
    
    @IBAction func clearDisplay(sender: AnyObject) {
        display.text = "0"
    }
    @IBAction func equalsTapped(sender: AnyObject) {
        
        typing = false
        var result = 0
        secondNumber = Int(display.text!)
       
        
        if operation == "+" {
            result = firstNumber! + secondNumber!
        } else if operation == "-" {
            result = firstNumber! - secondNumber!
        }
        else if operation == "*" {
            result = firstNumber! * secondNumber!
        }
        else if operation == "/" {
            result = firstNumber! / secondNumber!
        }
        
        
        display.text = "\(result)"
        
    }

    @IBAction func Operation(sender: UIButton) {
        
        typing = false
        firstNumber = Int(display.text!)
        operation = sender.currentTitle!
        
    }
    @IBAction func Number(sender: UIButton) {
        let number = sender.currentTitle!
        
        if typing
        {
            display.text = display.text! + number
        } else {
            display.text = number
            typing = true
        }
        
        
    }
    @IBOutlet var display: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


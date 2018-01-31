//
//  ViewController.swift
//  simple-calc-iOS
//
//  Created by Yicheng Jiang on 1/30/18.
//  Copyright © 2018 Yicheng Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var input: String = ""
    var firstNum: Double = 0.0
    var inputNums: [Double] = []
    var op: String = ""
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func Numbers(_ sender: UIButton) {
        input += (sender.titleLabel?.text!)!
        if (op != ""){
            displayLabel.text = String(firstNum) + op + String(input)
        }else {
            displayLabel.text = String(input)
        }
    }
    

    @IBAction func Result(_ sender: UIButton) {
        let result = calculate()
        displayLabel.text = String(result)
    }
    
    @IBAction func Clear(_ sender: UIButton) {
        input = ""
        firstNum = 0
        inputNums = []
        op = ""
        displayLabel.text = "0"
    }
    
    
    @IBAction func Operator(_ sender: UIButton) {
        op = (sender.titleLabel?.text!)!
        firstNum = Double(input)!
        displayLabel.text = String(firstNum) + op
        if op == "count" || op == "avg" {
            self.inputNums.append(firstNum)
        }
        if op == "fact" {
            var result = 1
            for i in 1..<Int(Double(input)! + 1) {
                result = result * i
            }
            displayLabel.text = String(result)
        }
        input = ""
    }
    
    private func calculate() -> Double{
        switch op {
        case "+":
            return firstNum + Double(input)!
        case "-":
            return firstNum - Double(input)!
        case "/":
            return firstNum / Double(input)!
        case "%":
            return Double(Int(firstNum) % Int(Double(input)!))
        case "*":
            return firstNum * Double(input)!
        case "count":
            self.inputNums.append(Double(input)!)
            return Double(self.inputNums.count)
        case "avg":
            self.inputNums.append(Double(input)!)
            var sum = 0.0
            for index in 0...inputNums.count - 1 {
                sum += inputNums[index]
            }
            return sum / Double((inputNums.count))
        default:
            return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


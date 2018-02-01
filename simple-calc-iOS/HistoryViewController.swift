//
//  HistoryViewController.swift
//  simple-calc-iOS
//
//  Created by Yicheng Jiang on 1/31/18.
//  Copyright © 2018 Yicheng Jiang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history: [[String]] = []
    
    
    @IBOutlet weak var HistoryView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        renderHistory()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMain" {
            let mainViewController = segue.destination as! ViewController
            mainViewController.history = self.history
        }
    }
    
    private func renderHistory() {
        if history.count > 0 {
            for index in 0...history.count-1{
                let label = UILabel(frame:CGRect(x: 50, y: index * 25+50, width: 300, height: 40))
                label.text = history[index].joined(separator: " ")
                HistoryView.addSubview(label)
            }
        }
    }
}

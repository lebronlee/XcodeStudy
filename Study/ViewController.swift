//
//  ViewController.swift
//  Study
//
//  Created by lebronlee on 2017/4/30.
//  Copyright © 2017年 lebronlee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum modes {
        case not_set
        case addition
        case subtraction
        case multiply
    }

    var savedNum:Int = 0
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var lastButtonWasMode:Bool = false
    
    
    
    @IBOutlet weak var numLabel: UILabel!
    
    
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        if (lastButtonWasMode) {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString.appending(stringValue!)
        updateText()
    }

    @IBAction func didPressPlus(_ sender: Any) {
        changeMode(newMode: .addition)
        
    }
    @IBAction func didPressSubtract(_ sender: Any) {
        changeMode(newMode: .subtraction)
    }
    @IBAction func didPressMultiply(_ sender: Any) {
        changeMode(newMode: .multiply)
    }
    @IBAction func didPressEqual(_ sender: Any) {
        guard let labelInt:Int = Int(labelString) else{
            return
        }
        if(currentMode == .not_set || lastButtonWasMode){
            return
        }
        if(currentMode == .addition){
            savedNum += labelInt
        }else if(currentMode == .subtraction){
            savedNum -= labelInt
        }else if(currentMode == .multiply){
            savedNum *= labelInt
        }
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    @IBAction func didPressClear(_ sender: Any) {
        currentMode = .not_set
        lastButtonWasMode = false
        labelString = "0"
        savedNum = 0
        numLabel.text = "0"
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateText() {
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        if(currentMode == .not_set){
            savedNum = labelInt
        }
        numLabel.text = "\(labelInt)"
    }
    
    func changeMode(newMode:modes) {
        if(savedNum == 0){
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }

}


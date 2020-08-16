//
//  ViewController.swift
//  Egg Timer
//
//  Created by Bryan Barreto on 16/08/20.
//  Copyright © 2020 Bryan Barreto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seconds:Int = 0
    var timer:Timer = Timer()
    
   // let eggDic:[String:Int] = ["soft":300,"medium":480,"hard":720]
    
        let eggDic:[String:Int] = ["soft":5,"medium":7,"hard":9]

    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func startTimer()->Void{
        
        timer.invalidate()
        
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                      selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
   @objc func updateTimer()->Void{
    
    mainLabel.text = String("\(self.seconds) seconds left")
        
        if(self.seconds > 0){
            self.seconds -= 1
        }else{
            timer.invalidate()
            mainLabel.text = "EGG IS DONE!"
        }
    }

    @IBAction func btnPress(_ sender: UIButton) {
        mainLabel.text = "Starting Timer..."
        
        let hardness:String = sender.currentTitle ?? ""
        self.seconds = eggDic[hardness]!
        startTimer()
    }
    
}


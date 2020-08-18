//
//  ViewController.swift
//  Egg Timer
//
//  Created by Bryan Barreto on 16/08/20.
//  Copyright © 2020 Bryan Barreto. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds:Int = 0
    var totalSeconds:Int = 0
    var timer:Timer = Timer()
    var player: AVAudioPlayer?
    
   // let eggDic:[String:Int] = ["soft":300,"medium":480,"hard":720]
    
        let eggDic:[String:Int] = ["soft":5,"medium":7,"hard":9]

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
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
        let percentage:Float = 1 - (Float(self.seconds) / Float(self.totalSeconds))
        if(self.seconds > 0){
            self.seconds -= 1
        }else{
            timer.invalidate()
            mainLabel.text = "EGG IS DONE!"
            playSound()
        }
        progressBar.setProgress(percentage, animated: true)
    }

    @IBAction func btnPress(_ sender: UIButton) {
        
        progressBar.progress = 0
        
        mainLabel.text = "\(sender.currentTitle!.uppercased()) EGG"

        let hardness:String = sender.currentTitle ?? ""
        self.seconds = eggDic[hardness]!
        self.totalSeconds = eggDic[hardness]!
        startTimer()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}


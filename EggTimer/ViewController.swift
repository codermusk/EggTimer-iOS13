//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
var player: AVAudioPlayer!

class ViewController: UIViewController {
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggtime = ["Soft":3, "Medium": 420 , "Hard":720]
    var timer = Timer()
    
    var totaltime  = 0
    var secondapassed  = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
    
        timer.invalidate()
        let hardness = sender.currentTitle!
        totaltime  = eggtime[hardness]!
        progressBar.progress = 0.0
        titleLabel.text = hardness
        secondapassed = 0
      timer =   Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if secondapassed < totaltime {
            secondapassed+=1
         
            
            progressBar.progress =   Float(secondapassed) / Float(totaltime)
            
        }else{
            timer.invalidate()
            titleLabel.text = "DONE...!!!"
            let url = Bundle.main.url(forResource:"alarm_sound" , withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}

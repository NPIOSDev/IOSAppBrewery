//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes: Dictionary<String,Int> = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12,
    ]
    
    var countdownTimer:Timer? = nil
    var secondPassed: Int = 0
    var audioPlayer: AVAudioPlayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!)
    }
    @IBAction func hardnessSelect(_ sender: UIButton) {
        let hardness = sender.currentTitle
        secondPassed = 0
        progressBar.progress = 0.0
        
        countdownTimer?.invalidate()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerUpdated), userInfo: [
            "life_span": eggTimes[hardness!] ?? 60,
            "type": hardness ?? "unknow"], repeats: true)
    }
    
    @objc func timerUpdated(timer:Timer) {
        let info = timer.userInfo as? Dictionary<String, Any>
        let lifeSpan: Int = info?["life_span"] as! Int
        let type: String = info?["type"] as! String
        
        progressBar.progress = Float(secondPassed) / Float(lifeSpan)
        titleLabel.text = "Cooking \(type) egg in \(lifeSpan - secondPassed) seconds"
        secondPassed += 1
        if secondPassed > lifeSpan {
            countdownTimer?.invalidate()
            countdownTimer = nil
            progressBar.progress = 1.0
            titleLabel.text = "Done"
            playAlarmSound()
        }
    }
    
    func playAlarmSound() {
        audioPlayer?.play()
    }
}

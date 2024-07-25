//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPress(_ sender: UIButton) {
        playSound(sender.currentTitle!)
        sender.alpha = 0.2
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = 1.0
        })
    }
    
    func playSound(_ name:String, _ extenstion:String="wav") {
        let url = Bundle.main.url(forResource: name, withExtension: extenstion)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}


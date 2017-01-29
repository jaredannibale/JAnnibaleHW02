//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Jared Annibale on 1/19/17.
//  Copyright © 2017 Jared Annibale. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var statementNumber: UILabel!
    
    @IBOutlet weak var sportsImage: UIImageView!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    
    var soundPlayer = AVAudioPlayer()
    
    var lastIndex =  -1
    
    var lastSound = -1
    var lastImage = -1
    let numOfImages = 10
    let numOfSounds = 7
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try soundPlayer = AVAudioPlayer(data: sound.data)
                soundPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file.")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName).")
        }
        
    }
    
    func nonRepeatedRandom(last: inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        
        last = random
        
        return random
    }
    
    
    // MARK: Actions
    

    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false {
            if lastSound != -1 {
            soundPlayer.stop()
            }
        }
    }

    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I Can't Wait to Use Your App!"]
        
        var random: Int
        
        random = nonRepeatedRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]
        
        statementNumber.text = String(random+1)
        
        sportsImage.isHidden = false
        random = nonRepeatedRandom(last: &lastImage, range: numOfImages)
        sportsImage.image = UIImage(named: "image" + String(random))
        
        if soundSwitch.isOn {
            random = nonRepeatedRandom(last: &lastSound, range: numOfSounds)
            playSound(soundName: "sound" + String(random))
        }
        
        
        /* messageLabel.text = messages[in
         dex]
         
         if index == messages.count-1 {
         index = 0
         
         } else {
         index = index + 1} */
        
        if messageLabel.text == "You Are Fantastic!" {
            messageLabel.textColor = UIColor.blue
        } else if messageLabel.text == "You Are Great!" {
            messageLabel.textColor = UIColor.green}
        else if messageLabel.text == "You Are Amazing!" {
            messageLabel.textColor = UIColor.magenta}
        else if messageLabel.text == "You Are Awesome!" {
            messageLabel.textColor = UIColor.brown}
        else if messageLabel.text == "When the Genius Bar needs help, they call you!" {
            messageLabel.textColor = UIColor.cyan}
        else if messageLabel.text == "You Brighten My Day!" {
            messageLabel.textColor = UIColor.orange}
        else {messageLabel.textColor = UIColor.darkGray}
        
        statementNumber.textColor = messageLabel.textColor
        
        
        
        
        
        
        
        
    }
    
   
    
    
}

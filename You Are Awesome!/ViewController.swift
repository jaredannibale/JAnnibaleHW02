//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Jared Annibale on 1/19/17.
//  Copyright © 2017 Jared Annibale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var statementNumber: UILabel!
    
    var lastIndex =  -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "I Can't Wait to Use Your App!"]
        
        var randomIndex: Int = Int(arc4random_uniform(UInt32(messages.count)))
        
        while randomIndex == lastIndex {
            print("Before Condition: My new randomIndex is \(randomIndex) and the lastIndex is \(lastIndex)")
            randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
            print("After Condition: My new randomIndex is \(randomIndex) and the lastIndex is \(lastIndex)")
        }
        
        lastIndex = randomIndex
        
        messageLabel.text = messages[randomIndex]

        statementNumber.text = String(randomIndex+1)
        
        
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

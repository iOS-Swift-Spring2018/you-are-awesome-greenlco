//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Connor Greenleaf on 1/1/18.
//  Copyright © 2018 Connor Greenleaf. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    let numberOfImages = 4
    let numberOfSounds = 4
    
    //Code below executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSound(soundName: String) {
        //Can we load in the sound name?
        if let sound = NSDataAsset(name: soundName) {
            // check if sound.data is a sound file
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
                
            }
        } else {
            // if reading in the NSDataAsset didn't work, tell the user / report the error.
            print("ERROR: file \(soundName) didn't load.")
            
        }
        
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        return newIndex
    }
    
    @IBAction func showMessagePressed(_ sender: UIButton) {

        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "When the Genius Bare needs help, they call you!",
                        "You Brighten My Day!",
                        "You Are Da Bomb!",
                        "I can't wait to use your app!",
                        "Fabulous? That's You!"]
        
        
        //Show a message
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //Show an image
        awesomeImage.isHidden = false
        
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "Image\(imageNumber)")
        
        //Get random number to use for random sound
    
        
        soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
        
        //Play a sound
        let soundName = "sound\(soundNumber)"
        playSound(soundName: soundName)

        
  //      var randomIndex = Int(arc4random_uniform(UInt32(messages.count)))
 //       messageLabel.text = messages[randomIndex]
        
        /*
        messageLabel.text = messages[index]
        index = index + 1
        
        if index == messages.count {
            index = 0
        }
        */
        
//        let message1 = "You Are Fantastic!!!!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2 {
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
//        }
        
    }
}

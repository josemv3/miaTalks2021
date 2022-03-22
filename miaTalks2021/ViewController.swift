//
//  ViewController.swift
//  miaTalks2021
//
//  Created by Joey Rubin on 5/12/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    var soundTypeSelected = "Human"
    var soundNameToPlay = "None"
    
    @IBOutlet weak var humanButton: UIButton!
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var monsterButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        humanButton.isSelected = true
        humanButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }

    @IBAction func buttonPressedAll(_ sender: UIButton) {
        
        soundNameToPlay = sender.currentTitle!
        let soundNameAndType = soundNameToPlay + soundTypeSelected
        playSound(soundName: soundNameAndType)
        
        sender.alpha = 0.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
           
            sender.alpha = 1.0
        }
    }
    
    @IBAction func soundTypePressed(_ sender: UIButton) {
        updateUI()
        
        soundTypeSelected = sender.currentTitle!
        sender.isHighlighted = true
        sender.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    func updateUI () {
        humanButton.backgroundColor = UIColor.clear
        robotButton.backgroundColor = UIColor.clear
        monsterButton.backgroundColor = UIColor.clear
    }
}


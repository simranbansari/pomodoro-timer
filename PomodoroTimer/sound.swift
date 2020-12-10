//
//  sound.swift
//  PomodoroTimer
//
//  Created by Simran Bansari on 2020-09-28.
//  Copyright © 2020 Simran Bansari. All rights reserved.
//

import Foundation

import AVFoundation

class sound {
    
    var audioPlayer:AVAudioPlayer?
    
    // creating enum datatype
    enum SoundEffect {
        case alarmbreak
    }
    
    func playSound(effect:SoundEffect) {
        
        var soundFilename = ""
        
        switch effect {
        case .alarmbreak:
            soundFilename = "alarmsound"
       
        }
        // get path to resource
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: ".wav")
        
        //check that it is not nill
        if bundlePath == nil {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            
            audioPlayer?.play()
        }
        catch {
            print("could not create")
            return
        }
        
        
        
    }
}

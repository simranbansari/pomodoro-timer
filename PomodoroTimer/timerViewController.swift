//
//  timerViewController.swift
//  PomodoroTimer
//
//  Created by Simran Bansari on 2020-06-29.
//  Copyright © 2020 Simran Bansari. All rights reserved.
//

import UIKit

class timerViewController: UIViewController {
    var button = 0
    var s = 0
    
    var soundPlayer = sound()
    
    @IBOutlet weak var rounds: UILabel!
    
    var finalValue = ""
    
    @IBOutlet weak var buttonDescription: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    let progress = Progress(totalUnitCount: 25)
    
    let progress2 = Progress(totalUnitCount: 25)
    
  


    
    @IBOutlet weak var breakView: UIProgressView!
    
    let breaks = Progress(totalUnitCount: 5)
    
    let breaks2 = Progress(totalUnitCount: 5)
  

    
    @IBOutlet weak var workTime: UILabel!
    var OurTimer = Timer()
    var TimerDisplayed = 25

    
    
    @IBOutlet weak var breakTime: UILabel!
    var OurBreak = Timer()
    var BreakDisplayed = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rounds.text = ("This is the number of rounds you would like: \(finalValue)")

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tap(_ sender: UIButton) {
        
        
        button += 1
        print(button)
        
        if button == 1  {
            buttonDescription.text = " Clicked"
        }
        
        
        
        if finalValue == "1" {
            
        
        OurBreak = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(BreakAction2), userInfo: nil, repeats: true)
        
        OurTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
        
        ori()
            
        }
        
        else if finalValue == "2" || finalValue == "3" || finalValue == "4" || finalValue == "5" {
            
            fired()
            original()
                

        }

    }
    
    @objc func ori(){
        progressView.progress = 0.0
        breakView.progress = 0.0
        
        progress2.completedUnitCount = 0
        breaks2.completedUnitCount = 0
        
        
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
            
            self.progress2.completedUnitCount += 1
            let progressFloat = Float(self.progress2.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            
            guard self.progress2.isFinished == false else {
                timer.invalidate()
                print("done22")
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
                         self.breaks2.completedUnitCount += 1
                         print("1")
                         let progressssss = Float(self.breaks2.fractionCompleted)
                         self.breakView.setProgress(progressssss, animated: true)
                             
                            
                    guard self.breaks2.isFinished == false else {
                        timer.invalidate()
                        print("done")
                        return
                    }
                    
                     }
                
                
                return
            }
            
            
        }
    }
    
    @objc func original() {
        //work progress bar
            Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
            
            guard self.progress.isFinished == false else {
                timer.invalidate()
                print("done")
                
                // break progress begins once work progress is completed
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
                    
                    guard self.breaks.isFinished == false else {
                        timer.invalidate()
                        print("done")
                        return
                    }
                        self.breaks.completedUnitCount += 1
                    let progresss = Float(self.breaks.fractionCompleted)
                    self.breakView.setProgress(progresss, animated: true)
                    
                    }
                return
            }
                self.progress.completedUnitCount += 1
        
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            
            }
    }
    
    @objc func resetProgress(){
        
        progressView.progress = 0.0
        breakView.progress = 0.0
        
        progress2.completedUnitCount = 0
        breaks2.completedUnitCount = 0
        
        
        
        Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
            
            self.progress2.completedUnitCount += 1
            let progressFloat = Float(self.progress2.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            
            guard self.progress2.isFinished == false else {
                timer.invalidate()
                print("done22")
                Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { (timer) in
                         self.breaks2.completedUnitCount += 1
                         print("1")
                         let progressssss = Float(self.breaks2.fractionCompleted)
                         self.breakView.setProgress(progressssss, animated: true)
                             
                            
                    guard self.breaks2.isFinished == false else {
                        timer.invalidate()
                        print("done")
                        return
                    }
                    
                     }
                
                
                return
            }
            
            
        }
    }
    
   
    

    
    @objc func resetWork(){
        
        if TimerDisplayed == 0 && BreakDisplayed == 0 {

    OurTimer.invalidate()
    TimerDisplayed = 25
    workTime.text = "25"
    OurTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(Action), userInfo: "timer", repeats: true)

        }
}

    @objc func resetBreak() {
        OurBreak.invalidate()
        BreakDisplayed = 6
        breakTime.text = "5"
        
        if finalValue == "2" {
        OurBreak = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(BreakAction2), userInfo: nil, repeats: true)
        
        }
        
        else if finalValue == "3" || finalValue == "4" || finalValue == "5"{
            OurBreak = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(BreakAction), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @objc func resetBreak2() {
        OurBreak.invalidate()
        BreakDisplayed = 6
        breakTime.text = "5"

        OurBreak = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(BreakAction2), userInfo: nil, repeats: true)
        
        
        

    }
    
    
    
    
    
    @objc func BreakAction(){
        
        if BreakDisplayed > 0 && TimerDisplayed == 0 {
            
            BreakDisplayed -= 1
            breakTime.text = String(BreakDisplayed)
            
        }
            
        else if BreakDisplayed == 0 && s <= 32{
            print("yes")
            OurBreak.invalidate()
            BreakDisplayed = 0
            breakTime.text = "0"
            resetProgress()
            resetWork()
            do{resetBreak()}
        }
        
        else if BreakDisplayed == 0 && finalValue == "3" {
            print("next")
            OurBreak.invalidate()
            BreakDisplayed = 0
            breakTime.text = "0"
            resetProgress()
            resetWork()
            do{resetBreak2()}
            
        }
        
        else if BreakDisplayed == 0 && s <= 63{
            print("yes2")
            OurBreak.invalidate()
            BreakDisplayed = 0
            breakTime.text = "0"
            resetProgress()
            resetWork()
            do{resetBreak()}
        }
        
        else if BreakDisplayed == 0 && finalValue == "4" {
                   print("next2")
                   OurBreak.invalidate()
                   BreakDisplayed = 0
                   breakTime.text = "0"
                   resetProgress()
                   resetWork()
                   do{resetBreak2()}
                   
               }
            
        else if BreakDisplayed == 0 && s <= 94{
            print("yes3")
            OurBreak.invalidate()
            BreakDisplayed = 0
            breakTime.text = "0"
            resetProgress()
            resetWork()
            do{resetBreak()}
        }
        
        else if BreakDisplayed == 0 && finalValue == "5" {
        print("next3")
        OurBreak.invalidate()
        BreakDisplayed = 0
        breakTime.text = "0"
        resetProgress()
        resetWork()
        do{resetBreak2()}
            
        }
        s += 1
        print(s)
        
    }
    
    @objc func BreakAction2(){
        if BreakDisplayed > 0 && TimerDisplayed == 0 {
            
            //play alarm for break time
            soundPlayer.playSound(effect: .alarmbreak)
            
            BreakDisplayed -= 1
            breakTime.text = String(BreakDisplayed)
            
            
        }
            
        else if BreakDisplayed == 0 {
            OurBreak.invalidate()
            OurTimer.invalidate()
            BreakDisplayed = 0
            breakTime.text = "0"
            TimerDisplayed = 0
            workTime.text = "0"
        }
        
    }
    
    
    
    
    
    
    
    @objc func Action(){
        if TimerDisplayed > 0 {
        TimerDisplayed -= 1
        workTime.text = String(TimerDisplayed)
        }
            
        else if TimerDisplayed == 0{
            OurTimer.invalidate()
            TimerDisplayed = 0
            workTime.text = "0"
        }
    }
    
    
    
    @objc func fired() {
        
                BreakDisplayed = 6
                breakTime.text = "5"
                
                TimerDisplayed = 25
                workTime.text = "25"
                
                OurBreak = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(BreakAction), userInfo: nil, repeats: true)
                 
                
                OurTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(Action), userInfo: nil, repeats: true)
       
        }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

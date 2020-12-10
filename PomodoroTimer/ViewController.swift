//
//  ViewController.swift
//  PomodoroTimer
//
//  Created by Simran Bansari on 2020-06-25.
//  Copyright © 2020 Simran Bansari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var slideLabel: UILabel!

    @IBOutlet weak var button: UIButton!
    
    var value: Int?

    var val = ""
    
    @IBAction func slide(_ sender: UISlider) {
        slideLabel.text = String(Int(sender.value))
        
        value = Int(sender.value)
        
        
    }
    
    
    @IBAction func pressed(_ sender: UIButton) {
        print("clicked")
        self.val = slideLabel.text!
        performSegue(withIdentifier: "transition", sender: self)
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transition" {
            let vc = segue.destination as! timerViewController
            vc.finalValue = self.val
        }
    }

}


//
//  sliderViewController.swift
//  PomodoroTimer
//
//  Created by Simran Bansari on 2020-06-26.
//  Copyright © 2020 Simran Bansari. All rights reserved.
//

import UIKit

class sliderViewController: ViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var slideLabel: UILabel!

    var value: Int?

    
    
    @IBAction func slide(_ sender: UISlider) {
        slideLabel.text = String(Int(sender.value))
        
        value = Int(sender.value)
        
        
    }
    
    @IBOutlet weak var button: UIButton!

    @IBAction func done(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

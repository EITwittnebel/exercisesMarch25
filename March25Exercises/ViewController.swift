//
//  ViewController.swift
//  March25Exercises
//
//  Created by Field Employee on 3/25/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var hypeSlider: UISlider!
  @IBOutlet weak var hypeLabel: UILabel!
  
  @IBOutlet weak var initialCost: UILabel!
  @IBOutlet weak var totalCost: UILabel!
  @IBAction func silderValueChanged(_ sender: Any) {
    let cost: Float = 100.00
    let tipValue: Float = ((hypeSlider.value*100).rounded()) / 100
    hypeLabel.text = String(format: "%.2f", tipValue) + "%"
    totalCost.text = String(format: "%.2f", cost + tipValue)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //hypeSlider.center.x = self.view.center.x
    //hypeSlider.center.y = self.view.center.y
    hypeLabel.center.x = self.view.center.x
    hypeLabel.center.y = self.view.center.y - 40
    
    let cost: Float = 100.00
    hypeSlider.minimumTrackTintColor = .green
    //hypeSlider.thumbTintColor = .black
    initialCost.text = String(format: "%.2f", cost)
  }


}


//
//  ViewController.swift
//  AccelerometerDemo
//
//  Created by Thomas Dobson on 11/14/18.
//  Copyright © 2018 Thomas Dobson. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motionManager: CMMotionManager!
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.accelerometerUpdateInterval = 0.3
        motionManager.startAccelerometerUpdates(to: .main, withHandler: uppdateLabels)
    }
    
    func uppdateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        xLabel.text = String(format: "X: %.1f", accelerometerData.acceleration.x)
        yLabel.text = String(format: "Y: %.1f", accelerometerData.acceleration.y)
        zLabel.text = String(format: "Z: %.1f", accelerometerData.acceleration.z)
    }

}


//
//  ViewController.swift
//  fahme003P06
//
//  Created by Fawaz on 10/4/18.
//  Copyright © 2018 fahme003P03. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var mainButton: UIButton!
    
    fileprivate let motionManager = CMMotionManager()
    fileprivate let queue = OperationQueue()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: queue) {
                (motion:CMDeviceMotion?, error:Error?) -> Void in
                if let motion = motion {
                    //let rotationRate = motion.rotationRate
                    let gravity = motion.gravity
                    //let userAcc = motion.userAcceleration
                    //let attitude = motion.attitude
                    
                    let mainF = self.mainButton.frame
                    
                    let cg = CGRect(x: gravity.x + Double(mainF.origin.x), y: Double(mainF.origin.y) - gravity.y,
                                    width: Double(mainF.size.width), height: Double(mainF.size.height))
                    
                    
                    
                    DispatchQueue.main.async {
                        self.mainButton.frame = cg
                    }
                }
            }
        }
    }
}

//
//  ViewController.swift
//  fahme003P06
//
//  Created by Fawaz on 10/8/18.
//  Copyright © 2018 fahme003P03. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController,
UIGestureRecognizerDelegate {

    @IBOutlet var mainButton: UIButton!
    
    
    fileprivate let manager = CMMotionManager()
    fileprivate let queue = OperationQueue()
    
    
    
 
    var pre: Double = 0
    var va : Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if manager.isDeviceMotionAvailable {
            manager.deviceMotionUpdateInterval = 0.01
            manager.startDeviceMotionUpdates(to: OperationQueue.main) {
                [weak self] (data: CMDeviceMotion?, error: Error?) in
                if (data?.gravity) != nil {
                    
                    /*
                     //let rotationRate = motion.rotationRate
                     //let gravity = motion.gravity
                     //let userAcc = motion.userAcceleration
                     //let attitude = motion.attitude
                     */
                    let x = Double((self?.mainButton.frame.origin.x)!) + data!.gravity.x
                    let y = Double((self?.mainButton.frame.origin.y)!) - data!.gravity.y
                    let w = Double((self?.mainButton.frame.size.width)!)
                    let h = Double((self?.mainButton.frame.size.height)!)
                    
                    var cg = CGRect(x: x , y: y,
                                    width: w , height:h)
                    
                    
                    if cg.origin.x > (self?.view.frame.size.width)!
                    {
                        
                        cg = CGRect(x: 0 , y: y, width: w, height: h)
                    }
                    else if cg.origin.y > (self?.view.frame.size.height)!
                    {
                        cg = CGRect(x: x , y: 0,  width: w, height: h)
                        
                    }
                    else if cg.origin.x < 0
                    {
                        cg = CGRect(x: Double((self?.view.frame.size.width)!),
                                    y: y, width: w, height: h)
                    }
                    else if cg.origin.y < 0
                    {
                        cg = CGRect(x: x , y: Double((self?.view.frame.size.height)!),
                                    width: w, height: h)
                    }
                    
                    self?.mainButton.frame = cg
                    
                }
            }
        }
        
    }
    @IBAction func buttonReset(_ sender: Any) {
        
        self.mainButton.frame = CGRect(x:63.0, y:485.0, width:105.0, height:36.0)
        //self.mainButton.titleLabel?.font =  UIFont(name: "System", size: 0)
        self.mainButton.titleLabel?.font =  UIFont(name: "System", size: 20.0)
      
        
    }
    
    @IBAction func pinchBu(_ sender: UIPinchGestureRecognizer) {
        
        //print(#function)
        
        let scale = sender.scale
        self.mainButton.transform = mainButton.transform.scaledBy(x: scale, y: scale)
        sender.scale = 1
    }
    @IBAction func rotateBu(_ sender: UIRotationGestureRecognizer) {
        //print(#function)
        
        let rotation = sender.rotation
        self.mainButton.transform = mainButton.transform.rotated(by: rotation)
        sender.rotation = 0
        
        //displayifneeded set needs to display 
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}


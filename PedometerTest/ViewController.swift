//
//  ViewController.swift
//  PedometerTest
//
//  Created by Andi Ikhsan Eldrian on 21/06/19.
//  Copyright © 2019 Andi Ikhsan Eldrian. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var stepsCountLabel: UILabel!
    
    
    let pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        startTrackingActivityType()
//        startCountingSteps()
//        startUpdating()
        myPedo()
    }
    
//    func startTrackingActivityType() {
//        activityManager.startActivityUpdates(to: OperationQueue.main) {
//            [weak self] (activity: CMMotionActivity?) in
//
//            guard let activity = activity else { return }
//            DispatchQueue.main.async {
//                if activity.walking {
//                    self?.activityTypeLabel.text = "Walking"
//                } else if activity.stationary {
//                    self?.activityTypeLabel.text = "Stationary"
//                } else if activity.running {
//                    self?.activityTypeLabel.text = "Running"
//                } else if activity.automotive {
//                    self?.activityTypeLabel.text = "Automotive"
//                }
//            }
//        }
//    }
    
//    func startCountingSteps() {
//        pedometer.startUpdates(from: Date()) {
//            [weak self] pedometerData, error in
//            guard let pedometerData = pedometerData, error == nil else { return }
//
//            DispatchQueue.main.async {
//                self?.stepsCountLabel.text = pedometerData.numberOfSteps.stringValue
//            }
//        }
//    }
    
//    func startUpdating() {
//        if CMMotionActivityManager.isActivityAvailable() {
//            startTrackingActivityType()
//        }
//
//        if CMPedometer.isStepCountingAvailable() {
//            startCountingSteps()
//        }
//    }

    func myPedo() {
        if CMPedometer.isStepCountingAvailable(){
            pedometer.startUpdates(from: Date()) { (data, error) in
                DispatchQueue.main.async { //penting
                    //code that caused error goes here
                    self.stepsCountLabel.text = data?.numberOfSteps.stringValue
                }
            }
        }
    }
}

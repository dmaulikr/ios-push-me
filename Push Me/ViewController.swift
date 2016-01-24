//
//  ViewController.swift
//  Push Me
//
//  Created by Kyle Haptonstall on 1/22/16.
//  Copyright © 2016 Kyle Haptonstall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Storyboard Outlets
    
    /**
        Sends the tag indicating which workout button was pressed to the segue
    
        -parameter sender: UIButton
    
    */
    @IBAction func onWorkoutSelection(sender: UIButton) {
        switch sender.tag{
        case 1:
            self.performSegueWithIdentifier("onWorkoutSelection", sender: 1)
        case 2:
            self.performSegueWithIdentifier("onWorkoutSelection", sender: 2)
        case 3:
            self.performSegueWithIdentifier("onWorkoutSelection", sender: 3)
        case 4:
            self.performSegueWithIdentifier("onWorkoutSelection", sender: 4)
        case 5:    
            self.performSegueWithIdentifier("onWorkoutSelection", sender: 5)
        default:
            break
        }
    }
    
    
    // MARK: Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let senderTag = sender as? Int{
            let destinationVC = segue.destinationViewController as! WorkoutSetupView
            
            var bgImg = UIImage()
            var buttonImg = UIImage()
            switch senderTag{
            case 1:
                bgImg = UIImage(named: "BG1")!
                buttonImg = UIImage(named: "Button1")!
                destinationVC.workoutName = "pushups"
            case 2:
                bgImg = UIImage(named: "BG2")!
                buttonImg = UIImage(named: "Button2")!
                destinationVC.workoutName = "situps"
            case 3:
                bgImg = UIImage(named: "BG3")!
                buttonImg = UIImage(named: "Button3")!
                destinationVC.workoutName = "squats"
            case 4:
                bgImg = UIImage(named: "BG4")!
                buttonImg = UIImage(named: "Button4")!
                destinationVC.workoutName = "mountain climbers"
            case 5:
                bgImg = UIImage(named: "BG5")!
                buttonImg = UIImage(named: "Button5")!
                destinationVC.workoutName = "lunges"
            default:
                break
            }
            
            destinationVC.imageToSetForBG = bgImg
            destinationVC.imageToSetForButton = buttonImg
        }
    }
    
}
   


//
//  WorkoutSetupView.swift
//  Push Me
//
//  Created by Kyle Haptonstall on 1/22/16.
//  Copyright © 2016 Kyle Haptonstall. All rights reserved.
//

import Foundation
import UIKit

class WorkoutSetupView: UIViewController{
    
    
    // MARK: - Storyboard Outlets
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var confirmationImage: UIImageView!
    
    @IBAction func onCancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
  
    
    @IBAction func oneSetReminder(sender: UIButton) {
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day, .Month, .Year, .Hour, .Minute], fromDate: timePicker.date)
        
        let fireDate = NSDate(withHour: components.hour, minute: components.minute, day: components.day, month: components.month, year: components.year)
        
        let notification = UILocalNotification()
        notification.timeZone = NSTimeZone.localTimeZone()
        notification.alertBody = "Let's do 25 \(workoutName!)!"
        notification.fireDate = fireDate
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.repeatInterval = NSCalendarUnit.Day
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
        confirmationImage.alpha = 1
        UIView.animateWithDuration(2.0, animations: {
            self.confirmationImage.alpha = 0 }, completion: { _ in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        
        
        
    }
    
    @IBOutlet weak var reminderButton: UIButton!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    
    
    // MARK: - Segue Passed Variables
    var imageToSetForBG:UIImage?
    var imageToSetForButton:UIImage?
    var workoutName:String?
    
    // MARK: - View Controller Methods
    
    override func viewDidLoad() {
        self.view.bringSubviewToFront(confirmationImage)
        timePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        self.backgroundImage.image = imageToSetForBG
        self.reminderButton.setImage(imageToSetForButton, forState: .Normal)
    }
    
    
}


// MARK: - NSDate Extension
extension NSDate{
    convenience init(withHour hour: Int, minute: Int, day : Int, month: Int, year: Int){
        let components = NSDateComponents()
        components.hour = hour
        components.minute = minute
        components.day = day
        components.month = month
        components.year = year
        components.timeZone = NSTimeZone.localTimeZone()
        let notificationDate = NSCalendar.currentCalendar().dateFromComponents(components)
        self.init(timeInterval: 0, sinceDate: notificationDate!)
}

}
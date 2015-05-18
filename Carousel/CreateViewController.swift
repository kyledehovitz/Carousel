//
//  CreateViewController.swift
//  Carousel
//
//  Created by Kyle DeHovitz on 5/14/15.
//  Copyright (c) 2015 Kyle DeHovitz. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var createButton: UIImageView!
    
    var bottomPosition: CGFloat!
    var topPosition: CGFloat!
    var buttonBottomPosition: CGFloat!
    var buttonTopPosition: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.enabled = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        bottomPosition = containerView.center.y
        topPosition = containerView.center.y - 95
        buttonBottomPosition = createButton.center.y
        buttonTopPosition = createButton.center.y - 150
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func didPressCheckButton(sender: AnyObject) {
        if checkButton.selected == false {
            checkButton.selected = true}
        else {checkButton.selected = false}
    }
    
    // Pull data from keyboard hide event
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            self.containerView.center.y = self.bottomPosition
            self.createButton.center.y = self.buttonBottomPosition
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    // Pull data from keyboard show event
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            self.containerView.center.y = self.topPosition
            self.createButton.center.y = self.buttonTopPosition
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    @IBAction func didTapOut(sender: AnyObject) {
        usernameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        confirmField.resignFirstResponder()
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
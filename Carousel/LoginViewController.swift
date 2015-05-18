//
//  LoginViewController.swift
//  Carousel
//
//  Created by Kyle DeHovitz on 5/12/15.
//  Copyright (c) 2015 Kyle DeHovitz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var buttonContainerView: UIView!
    @IBOutlet weak var loginView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var textImageView: UIImageView!
    
    var bottomPosition: CGFloat!
    var topPosition: CGFloat!
    var bottomButtonPosition: CGFloat!
    var topButtonPosition: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        bottomPosition = containerView.center.y
        topPosition = containerView.center.y - 80
        bottomButtonPosition = buttonContainerView.center.y
        topButtonPosition = buttonContainerView.center.y - 200
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
            self.buttonContainerView.center.y = self.bottomButtonPosition
            
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
            self.buttonContainerView.center.y = self.topButtonPosition
            
            // Set view properties in here that you want to match with the animation of the keyboard
            // If you need it, you can use the kbSize property above to get the keyboard width and height.
            }, completion: nil)
    }
    
    func didTapOut(sender: AnyObject) {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }
    
    
    @IBAction func didPressLoginButton(sender: AnyObject) {
        // No credentials
        if emailField.text.isEmpty && passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Login Error", message: "Please enter a username and password", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            self.view.endEditing(true)
            
        }
        
        else if passwordField.text.isEmpty {
            var alertView = UIAlertView(title:"Oops!", message: "Make sure to enter a password", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
            
        else if emailField.text.isEmpty {
            var alertView = UIAlertView(title:"Oops!", message: "Make sure to enter an email", delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
        }
    
    
        else {
        // Proper credentials
            if emailField.text == "kyled@uber.com" && passwordField.text == "password" {
                println("credentials are correct")
                var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
                alertView.show()
                self.view.endEditing(true)
                delay(2.0, { () -> () in
                    alertView.dismissWithClickedButtonIndex(0, animated: true)
                    self.performSegueWithIdentifier("loginSegue", sender: nil)
                })
            }
                    
            else {
                // Incorrect credentials
                println("credentials are incorrect")
                var alertView = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
                alertView.show()
                delay(2.0, { () -> () in
                    alertView.dismissWithClickedButtonIndex(0, animated: true)
                    var alertView = UIAlertView(title: "Sign In Failed", message: "Incorrect username or password", delegate: nil, cancelButtonTitle: "OK")
                    alertView.show()
                })
            }
        }
    }

    @IBAction func didPressBack(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }



}
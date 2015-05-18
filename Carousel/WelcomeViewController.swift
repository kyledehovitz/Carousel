//
//  WelcomeViewController.swift
//
//
//  Created by Kyle DeHovitz on 5/12/15.
//
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var welcomeImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var spinImageView: UIImageView!
    @IBOutlet weak var selectorSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeScrollView.contentSize = CGSize(width: 1280, height: 320)
        welcomeScrollView.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(welcomeScrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        if  page == 4 {
            pageControl.alpha = 0
        }
        
        if pageControl.currentPage == 3{
            UIView.animateWithDuration(0.1, animations: {
                self.pageControl.alpha = 0
                self.spinImageView.alpha = 1
                self.selectorSwitch.alpha = 1
            })
        }

        else {
            pageControl.alpha = 1
            spinImageView.alpha = 0
            selectorSwitch.alpha = 0
        }
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

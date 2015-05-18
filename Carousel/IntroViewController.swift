//
//  IntroViewController.swift
//  Carousel
//
//  Created by Kyle DeHovitz on 5/12/15.
//  Copyright (c) 2015 Kyle DeHovitz. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio}
    
    func transformView(view: UIView!, atIndex index : Int, offset : Float){}
    
    func updateViewTransformWithOffset(offset: Float){}
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image!.size
        introScrollView.delegate = self
        introScrollView.sendSubviewToBack(introImageView)
        
//      Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var offset = Float(introScrollView.contentOffset.y)
        
//      content offset: 0 -> 568
//      x-offset: -30 -> 0
//      y-offset: -285 -> 0
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -50, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -305, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform =
            CGAffineTransformMakeTranslation(CGFloat(tx),CGFloat(ty))
        tile1View.transform =
            CGAffineTransformScale(tile1View.transform, CGFloat(scale), CGFloat(scale))
        tile1View.transform =
            CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))
        
//      tile2 offset
//      x-offset: 75 -> 0
//      y-offset: -240 -> 0
        
        var t1x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 50, r2Max: 0)
        var t1y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -270, r2Max: 0)
        var scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile2View.transform =
            CGAffineTransformMakeTranslation(CGFloat(t1x),CGFloat(t1y))
        tile2View.transform =
            CGAffineTransformScale(tile2View.transform, CGFloat(scale1), CGFloat(scale1))
        tile2View.transform =
            CGAffineTransformRotate(tile2View.transform, CGFloat(Double(rotation1) * M_PI / 180))
        
//      tile3 offset
        
        var t2x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 0, r2Max: 0)
        var t2y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -430, r2Max: 0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max: 1)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile3View.transform =
            CGAffineTransformMakeTranslation(CGFloat(t2x),CGFloat(t2y))
        tile3View.transform =
            CGAffineTransformScale(tile3View.transform, CGFloat(scale2), CGFloat(scale2))
        tile3View.transform =
            CGAffineTransformRotate(tile3View.transform, CGFloat(Double(rotation2) * M_PI / 180))
    
//      tile4 offset
    
        var t3x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 75, r2Max: 0)
        var t3y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max: 0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max: 1)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile4View.transform =
            CGAffineTransformMakeTranslation(CGFloat(t3x),CGFloat(t3y))
        tile4View.transform =
            CGAffineTransformScale(tile4View.transform, CGFloat(scale3), CGFloat(scale3))
        tile4View.transform =
            CGAffineTransformRotate(tile4View.transform, CGFloat(Double(rotation3) * M_PI / 180))
        
//      tile5 offset
        
        var t4x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -100, r2Max: 0)
        var t4y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -520, r2Max: 0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max: 0)
        
        tile5View.transform =
            CGAffineTransformMakeTranslation(CGFloat(t4x),CGFloat(t4y))
        tile5View.transform =
            CGAffineTransformScale(tile5View.transform, CGFloat(scale4), CGFloat(scale4))
        tile5View.transform =
            CGAffineTransformRotate(tile5View.transform, CGFloat(Double(rotation4) * M_PI / 180))
        
//      tile6 offset
        
        var t5x = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -80, r2Max: 0)
        var t5y = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max: 0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max: 1)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile6View.transform =
            CGAffineTransformMakeTranslation(CGFloat(t5x),CGFloat(t5y))
        tile6View.transform =
            CGAffineTransformScale(tile6View.transform, CGFloat(scale5), CGFloat(scale5))
        tile6View.transform =
            CGAffineTransformRotate(tile6View.transform, CGFloat(Double(rotation5) * M_PI / 180))

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
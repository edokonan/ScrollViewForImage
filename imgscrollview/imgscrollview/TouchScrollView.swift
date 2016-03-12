//
//  TouchScrollView.swift
//  imgscrollview
//
//  Created by ZHUKUI on 2016/03/06.
//  Copyright © 2016年 ZHUKUI. All rights reserved.
//

import Foundation
import UIKit

protocol ScrollViewDelegate{
    func modalChanged(TouchNumber: Int)
}

var location = CGPoint(x: 0, y: 0)


class TouchScrollView: UIScrollView {
    
    var Delegate: ScrollViewDelegate!
    var imageView: UIImageView!
    var TouchPoint : UIImageView!
    
    //override init(frame: CGRect) {
    //    super.init(frame: CGRectZero)
    //}

    
    //TOUCH BEGAN
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    //override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        //println("touchbegan")
        //for touch: AnyObject in touches {
            //var t: UITouch = touch as! UITouch
            //self.Delegate.modalChanged(Int(t.view.tag - 1))
        //}
        
        let touch : UITouch! = touches.first
        location = touch.locationInView(self)
        TouchPoint.center = location
        //print(location)
    }
    
    //TOUCH AND MOVE
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch : UITouch! = touches.first
        location = touch.locationInView(self)
        
        if location.x<0 { location.x=0}
        if location.y<0 { location.y=0}
        if location.x > self.frame.width { location.x=self.frame.width}
        if location.y > self.frame.height { location.y=self.frame.height}
        
        TouchPoint.center = location
    }
    
    //TOUCH END
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //println("touchended")
        let touch : UITouch! = touches.first
        location = touch.locationInView(self)
        if location.x<0 { location.x=0}
        if location.y<0 { location.y=0}
        if location.x > self.imageView.frame.width { location.x=self.imageView.frame.width}
        if location.y > self.imageView.frame.height { location.y=self.imageView.frame.height}
        
        TouchPoint.center = location
        //print(self.imageView.frame.width)
        //print(self.imageView.frame.height)
        //print(location)
    }
    
}
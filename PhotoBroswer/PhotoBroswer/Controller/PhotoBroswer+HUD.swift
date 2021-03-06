//
//  PhotoBroswer+HUD.swift
//  PhotoBroswer
//
//  Created by 冯成林 on 15/8/11.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit


extension PhotoBroswer{
  
    
    /** 展示 */
    func showHUD(text: String,autoDismiss: Double){
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.hud.alpha = 1
        })
        
        hud.text = text
        
        self.view.addSubview(hud)
        let margin = self.view.bounds.size.width * 0.3
        hud.make_center(CGPointZero, width: 120, height: 44)
        
        if autoDismiss == -1 {return}
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(autoDismiss * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {[unowned self] () -> Void in
            
            self.dismissHUD()
        })
    }
    
    /** 消失 */
    func dismissHUD(){
        
        UIView.animateWithDuration(0.25, animations: {[unowned self] () -> Void in
            
            self.hud.alpha = 0
            
        }) { (compelte) -> Void in
            
            self.hud.text = ""
            
            self.hud.removeFromSuperview()
        }
    }
    
}


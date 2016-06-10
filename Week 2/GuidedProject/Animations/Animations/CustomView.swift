//
//  CustomView.swift
//  Animations
//
//  Created by Justin Smith on 6/8/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var originalFrame: CGRect = CGRectZero
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupView() {
        self.originalFrame = self.frame
    }
    
    func moveInFromLeft(completion: (readyForImage: Bool) -> Void) {
        UIView.animateWithDuration(0.2, animations: { 
            self.frame = CGRectMake(self.originalFrame.origin.x + 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
            }) { (_) in
                self.frame = CGRectMake(self.originalFrame.origin.x - 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
                completion(readyForImage: true)
                UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: [], animations: { 
                    self.frame = self.originalFrame
                    }, completion: nil)
        }
    }
    
    func moveInFromRight(completion: (readyForImage: Bool) -> Void) {
        
        UIView.animateWithDuration(0.2, animations: { 
            self.frame = CGRectMake(self.originalFrame.origin.x - 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
            }) { (_) in
                self.frame = CGRectMake(self.originalFrame.origin.x + 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
                completion(readyForImage: true)
                UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: [], animations: { 
                    self.frame = self.originalFrame
                    }, completion: nil)
        }
    }
}


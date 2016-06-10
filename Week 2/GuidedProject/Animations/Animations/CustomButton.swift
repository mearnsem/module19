//
//  CustomButton.swift
//  Animations
//
//  Created by Justin Smith on 6/8/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    var originalFrame: CGRect = CGRectZero
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        self.originalFrame = self.frame
        print(originalFrame)
    }
    
    func moveRight() {
        UIView.animateWithDuration(0.3, animations: {
            self.frame = CGRectMake(self.originalFrame.origin.x + 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
            }) { (_) in
                self.alpha = 0.0
                self.frame = CGRectMake(self.originalFrame.origin.x - 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
                UIView.animateWithDuration(0.5, animations: { 
                    self.alpha = 1.0
                    self.frame = self.originalFrame
                    }, completion: nil)
        }
    }
    
    func moveLeft() {
        UIView.animateWithDuration(0.3, animations: { 
            self.frame = CGRectMake(self.originalFrame.origin.x - 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
            }) { (_) in
                self.alpha = 0.0
                self.frame = CGRectMake(self.originalFrame.origin.x + 400, self.originalFrame.origin.y, self.originalFrame.width, self.originalFrame.height)
                UIView.animateWithDuration(0.5, animations: { 
                    self.alpha = 1.0
                    self.frame = self.originalFrame
                    }, completion: nil)
        }
    }
}

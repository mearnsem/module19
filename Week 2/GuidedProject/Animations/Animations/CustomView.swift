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
}


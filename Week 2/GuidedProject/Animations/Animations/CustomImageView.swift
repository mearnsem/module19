//
//  CustomImageView.swift
//  Animations
//
//  Created by Justin Smith on 6/8/16.
//  Copyright © 2016 Justin Smith. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            setupView()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
}
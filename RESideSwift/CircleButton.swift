//
//  CircleButton.swift
//  demo_ccp05
//
//  Created by FaiFai on 2/18/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.layer.cornerRadius = CircleButton.cornerRadiusForRect(self.bounds)
        self.applyTheme()
    }
    
    class func cornerRadiusForRect(rect: CGRect) -> CGFloat {
        return min(CGRectGetWidth(rect), CGRectGetHeight(rect)) / 2.0
    }

}

//
//  UIView+.swift
//  alert_picker
//
//  Created by Kentarou on 2018/07/12.
//  Copyright © 2018年 西川継延. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // borderColor
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map{ UIColor(cgColor: $0) } }
        set (color){ layer.borderColor = color?.cgColor }
    }
    
    // borderwidth
    @IBInspectable var borderwidth: CGFloat {
        get { return layer.borderWidth }
        set(borderWidth) { layer.borderWidth = borderWidth }
    }
    
    // cornerRadius
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set(cornerRadius) { layer.cornerRadius = cornerRadius}
    }
    
    // masksToBounds
    @IBInspectable var masksToBounds: Bool {
        get { return layer.masksToBounds }
        set (masksToBounds) { layer.masksToBounds = masksToBounds}
    }
}

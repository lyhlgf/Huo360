//
//  UILabelExtension.swift
//  Huo360
//
//  Created by Cloud on 17/1/14.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import UIKit

extension UILabel{
    
    func requiredHeight() -> UILabel {
        
        let label:UILabel = UILabel(frame: CGRect(x: 16, y: 377, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        return label
    }
}

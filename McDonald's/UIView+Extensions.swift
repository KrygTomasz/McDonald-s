//
//  UIView+Extensions.swift
//  McDonald's
//
//  Created by Kryg Tomasz on 19.10.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.layer.shadowRadius = 0
        self.layer.shouldRasterize = true
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
    }

}

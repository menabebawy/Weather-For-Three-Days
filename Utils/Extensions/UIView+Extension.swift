//
//  UIView+Extension.swift
//  Utils
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

public extension UIView {
    
    static func nib() -> UINib {
        return UINib(nibName: "\(self)", bundle: Bundle(for: self))
    }

}

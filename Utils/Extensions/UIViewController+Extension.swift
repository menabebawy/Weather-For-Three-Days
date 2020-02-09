//
//  UIViewController+Extension.swift
//  Utils
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func showErrorAlertController(withMessage message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}

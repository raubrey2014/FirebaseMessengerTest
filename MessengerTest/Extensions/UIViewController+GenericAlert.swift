//
//  UIViewController+GenericAlert.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 5/5/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit

extension UIViewController {
    func showGenericAlert(withTitle title: String, withMessage message: String, completionHandler: @escaping (() -> Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            completionHandler()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

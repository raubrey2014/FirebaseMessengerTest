//
//  UIViewController+LoadingIndicator.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 5/5/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func showFullScreenLoadingIndicator() {
        //FIXME : Tag view so it can be removed later?
        let specialActivityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        specialActivityIndicator.tag = 1234
        specialActivityIndicator.center = self.view.center
        specialActivityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        specialActivityIndicator.startAnimating()
        self.view.addSubview(specialActivityIndicator)
    }
    
    func hideFullScreenLoadingIndicator() {
        if let indicatorToRemove = self.view.viewWithTag(1234) {
            indicatorToRemove.removeFromSuperview()
        }
    }
}

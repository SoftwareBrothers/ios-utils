//
//  AlertHandler.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import Foundation
import UIKit

public protocol AlertHandler {
    
    func showAlert(title: String?, message: String?)
    func showAlert(message: String)
    func showConfirmationAlert(title: String?, message: String?, completion: (() -> Void)?)
}

public extension AlertHandler {
    
    public func showAlert(withMessage message: String) {
        showAlert(title: nil, message: message)
    }
}

//
//  AlertPresenter.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import Foundation
import UIKit

public protocol AlertPresenter {
    
    func showAlert(title: String?, message: String?)
    func showAlert(message: String)
    func showConfirmationAlert(title: String?, message: String?, completion: (() -> Void)?)
}

public extension AlertPresenter {
    
    public func showAlert(message: String) {
        showAlert(title: nil, message: message)
    }
}

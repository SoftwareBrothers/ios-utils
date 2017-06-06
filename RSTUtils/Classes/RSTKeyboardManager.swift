//
//  RSTKeyboardManager.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import Foundation

@objc public protocol RSTKeyboardManagerDelegate: class {
    
    @objc optional func keyboardWillShow(with size: CGSize, animationTime: Double)
    @objc optional func keyboardWillHide()
    @objc optional func keyboardDidShow()
    @objc optional func keyboardDidHide()
}

public final class RSTKeyboardManager {
    
    private enum KeyboardState {
        case shown, hidden
    }
    
    // MARK: Properties
    
    weak public var delegate: RSTKeyboardManagerDelegate?
    private var keyboardState: KeyboardState = .hidden
    
    // MARK: Lifecycle
    
    public init() {
        registerForKeyboardNotification()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Private methods
    
    private func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(notification:)),
                                               name: NSNotification.Name.UIKeyboardDidShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardDidHide,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let animationTime = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber {
            delegate?.keyboardWillShow?(with: keyboardSize.size, animationTime: animationTime.doubleValue)
        }
    }
    
    @objc private func keyboardDidShow(notification: NSNotification) {
        keyboardState = .shown
        delegate?.keyboardDidShow?()
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        delegate?.keyboardWillHide?()
    }
    
    @objc private func keyboardDidHide(notification: NSNotification) {
        keyboardState = .hidden
        delegate?.keyboardDidHide?()
    }
}


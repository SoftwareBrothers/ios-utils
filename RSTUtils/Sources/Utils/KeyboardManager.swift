//
//  RSTKeyboardManager.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import Foundation

@objc public protocol KeyboardManagerDelegate: class {
    
    @objc optional func keyboardWillShow(with size: CGSize, animationTime: Double)
    @objc optional func keyboardWillHide()
    @objc optional func keyboardDidShow()
    @objc optional func keyboardDidHide()
}

public final class KeyboardManager {
    
    private enum KeyboardState {
        case shown, hidden
    }
    
    // MARK: Properties
    
    weak public var delegate: KeyboardManagerDelegate?
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
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow(notification:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide(notification:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let animationTime = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
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


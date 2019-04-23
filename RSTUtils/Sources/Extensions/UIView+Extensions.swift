//
//  UIView+Extensions.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import UIKit

public extension UIView {
    
    // MARK: Public methods
    
    /** Adds subview and constrains it with autolayout to fill the superview */
    public func addSubviewConstrainedToEdges(_ subview: UIView) {
        addSubview(subview)
        constrainSubviewToEdges(subview)
    }
    
    /** Adds subview at index and constrains it with autolayout to fill the superview */
    public func insertSubviewConstrainedToEdges(_ subview: UIView, at index: Int) {
        insertSubview(subview, at: index)
        constrainSubviewToEdges(subview)
    }
    
    public func addSubview(_ subview: UIView, centerInView: UIView) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraint(NSLayoutConstraint(item: centerInView, attribute: .centerX, relatedBy: .equal, toItem: subview, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: centerInView, attribute: .centerY, relatedBy: .equal, toItem: subview, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    /** Sets rounded corners. If the view is a square it clips it to a circle. */
    public func setRoundedCorners() {
        layer.cornerRadius = min(frame.size.height, frame.size.width) / 2.0
    }
    
    // MARK: Private methods
    
    /** Constraints the specified subview to completely fill the receiver view */
    private func constrainSubviewToEdges(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        let views = ["subview": subview]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[subview]-(0)-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: views))
    }
}

//
//  NibLoadable.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

import UIKit

public protocol NibLoadable {
    
    static var nibName: String {get}
}

public extension NibLoadable {
    
    public static var nibName: String {
        return String(describing: Self.self)
    }
}

public extension NibLoadable where Self: UIView {
    
    public static func loadFromNib() -> Self {
        let bundle = Bundle(for: Self.self)
        return bundle.loadNibNamed(Self.nibName, owner: self, options: nil)!.first as! Self
    }
}

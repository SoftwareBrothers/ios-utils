//
//  ReuseIdentifiable.swift
//  Pods
//
//  Created by Piotr Gorzelany on 06/06/2017.
//
//

public protocol ReuseIdentifiable {
    
    static var reuseIdentifier: String {get}
    
}

public extension ReuseIdentifiable {
    
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
}

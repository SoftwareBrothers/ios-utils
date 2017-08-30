//
//  File.swift
//  RSTUtils
//
//  Created by Piotr Gorzelany on 27/06/2017.
//

import Foundation

public extension Double {
    
    /** Rounds a number to the specified number of decimal places */
    func round(precision: Int) -> Double {
        let precisionMultiplier = pow(10.0, Double(precision))
        return (self * precisionMultiplier).rounded(.down) / precisionMultiplier
    }
}

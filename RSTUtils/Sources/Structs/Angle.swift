//
//  Angle.swift
//  RSTUtils
//
//  Created by Piotr Gorzelany on 27/06/2017.
//

import Foundation

public struct Angle: Equatable {
    
    static func degrees(from radians: CGFloat) -> CGFloat {
        return radians * 180 / CGFloat(Double.pi)
    }
    
    static func radians(from degrees: CGFloat) -> CGFloat {
        return degrees * CGFloat(Double.pi) / 180
    }
    
    // MARK: Properties
    
    let degrees: CGFloat
    var radians: CGFloat {
        return Angle.radians(from: degrees)
    }
    
    init(degrees: CGFloat) {
        self.degrees = degrees
    }
    
    init(radians: CGFloat) {
        self.degrees = Angle.degrees(from: radians)
    }
}

public func +(lhs: Angle, rhs: Angle) -> Angle {
    return Angle(degrees: lhs.degrees + rhs.degrees)
}

extension Angle {
    public static func ==(lhs: Angle, rhs: Angle) -> Bool {
        return lhs.degrees == rhs.degrees
    }
}

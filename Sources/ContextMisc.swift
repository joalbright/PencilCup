//
//  ContextMisc.swift
//  PencilCup
//
//  Created by Jo Albright on 10/28/15.
//  Copyright © 2015 Jo Albright. All rights reserved.
//

import UIKit

typealias TPoint = (x: CGFloat, y: CGFloat)
public typealias TCurve = (a1: CGPoint, a2: CGPoint, p: CGPoint)
public typealias TSize = (width: CGFloat, height: CGFloat)
public typealias TScale = (x: CGFloat, y: CGFloat)
public typealias TDelta = (dx: CGFloat, dy: CGFloat)

/// Update left CGPoint with offset of right CGPoint
public func += (lhs: inout CGPoint, rhs: CGPoint) {
    
    lhs.x += rhs.x; lhs.y += rhs.y

}

/// Add right point to left point
/// - returns: CGPoint
public func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    
    return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)

}

/// Subtract right point from left point
/// - returns: CGPoint
public func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
    
    return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)

}

/// Multiple right to left (x&&y)
public func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
    
    return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)

}

// MARK: - CGSize Operators

/// Scale a CGSize by CGFloat value
/// - returns: CGSize
public func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
    
    return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)

}

/// Scale a CGSize by CGFloat value
/// - returns: CGSize
public func * (lhs: TSize, rhs: CGFloat) -> TSize {
    
    return (width: lhs.width * rhs, height: lhs.height * rhs)

}


extension CGFloat {
    
    init(_ n: CGFloat, min: CGFloat, max: CGFloat) {
        
        self = n
        if n < min { self = min }
        if n > max { self = max }
        
    }
    
    init(_ n: CGFloat, range: Range<Int>) {
        
        self = n
        if n < CGFloat(range.lowerBound) { self = CGFloat(range.lowerBound) }
        if n > CGFloat(range.upperBound) { self = CGFloat(range.upperBound) }
        
    }
    
}

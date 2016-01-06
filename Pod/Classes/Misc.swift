//
//  Operators.swift
//  PencilCup
//
//  Created by Jo Albright on 10/28/15.
//  Copyright © 2015 Jo Albright. All rights reserved.
//

import UIKit

public typealias PCPoint = (x: CGFloat, y: CGFloat)
public typealias PCSize = (width: CGFloat, height: CGFloat)
public typealias PCScale = (x: CGFloat, y: CGFloat)
public typealias PCDelta = (dx: CGFloat, dy: CGFloat)

/// Update left CGPoint with offset of right CGPoint
public func += (inout lhs: CGPoint, rhs: CGPoint) {
    
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

public func - (lhs: CGPoint, rhs: PCPoint) -> CGPoint {
    
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
public func * (lhs: PCSize, rhs: CGFloat) -> PCSize {
    
    return (width: lhs.width * rhs, height: lhs.height * rhs)

}





//
//  Operators.swift
//  PencilCup
//
//  Created by Jo Albright on 10/28/15.
//  Copyright © 2015 Jo Albright. All rights reserved.
//

import UIKit

/// Update left CGPoint with offset of right CGPoint
func += (inout lhs: CGPoint, rhs: CGPoint) { lhs.x += rhs.x; lhs.y += rhs.y }

/// Add right point to left point
/// - returns: CGPoint
func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint { return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y) }

/// Subtract right point from left point
/// - returns: CGPoint
func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint { return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y) }
func - (lhs: CGPoint, rhs: PCPoint) -> CGPoint { return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y) }

/// Multiple right to left (x&&y)
func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint { return CGPoint(x: lhs.x * rhs, y: lhs.y * rhs) }

// MARK: - CGSize Operators

/// Scale a CGSize by CGFloat value
/// - returns: CGSize
func * (lhs: CGSize, rhs: CGFloat) -> CGSize { return CGSize(width: lhs.width * rhs, height: lhs.height * rhs) }

/// Scale a CGSize by CGFloat value
/// - returns: CGSize
func * (lhs: PCSize, rhs: CGFloat) -> PCSize { return (width: lhs.width * rhs, height: lhs.height * rhs) }

// MARK: - CGContext Operators

infix operator ->- { associativity left precedence 200 }

/// CGContext Move To Point
func ->- (lhs: CGContextRef?, rhs: PCPoint) -> CGContextRef? { CGContextMoveToPoint(lhs, rhs.x, rhs.y); return lhs }

/// CGContext Move To Point
func ->- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? { CGContextMoveToPoint(lhs, rhs.x, rhs.y); return lhs }

infix operator -+- { associativity left precedence 200 }

/// CGContext Add Line To Point
func -+- (lhs: CGContextRef?, rhs: PCPoint) -> CGContextRef? { CGContextAddLineToPoint(lhs, rhs.x, rhs.y); return lhs }

/// CGContext Add Line To Point
func -+- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? { CGContextAddLineToPoint(lhs, rhs.x, rhs.y); return lhs }

infix operator -~- { associativity left precedence 200 }

/// CGContext Add Curve To Point
func -~- (lhs: CGContextRef?, rhs: (PCPoint, PCPoint, PCPoint)) -> CGContextRef? { lhs -~- (rhs.0.x,rhs.0.y,rhs.1.x,rhs.1.y,rhs.2.x,rhs.2.y); return lhs }

/// CGContext Add Curve To Point
func -~- (lhs: CGContextRef?, rhs: (CGPoint,CGPoint,CGPoint)) -> CGContextRef? { lhs -~- (rhs.0.x,rhs.0.y,rhs.1.x,rhs.1.y,rhs.2.x,rhs.2.y); return lhs }

/// CGContext Add Curve To Point
func -~- (lhs: CGContextRef?, rhs: (CGFloat,CGFloat,CGFloat,CGFloat,CGFloat,CGFloat)) -> CGContextRef? {
    
    CGContextAddCurveToPoint(lhs,rhs.0,rhs.1,rhs.2,rhs.3,rhs.4,rhs.5); return lhs
    
}

infix operator -•- { associativity left precedence 200 }

/// CGContext Create Dot : Diameter = Stroke Width
func -•- (lhs: CGContextRef?, rhs: PCPoint) -> CGContextRef? { return lhs ->- rhs -+- rhs -□ nil }
/// CGContext Create Dot : Diameter = Stroke Width
func -•- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? { return lhs ->- rhs -+- rhs -□ nil }

infix operator -■ { associativity left precedence 200 }

/// CGContext Fill Path
func -■ (lhs: CGContextRef?, rhs: AnyObject?) -> CGContextRef? { CGContextFillPath(lhs); return lhs }

infix operator -□ { associativity left precedence 200 }

/// CGContext Stroke Path
func -□ (lhs: CGContextRef?, rhs: AnyObject?) -> CGContextRef? { CGContextStrokePath(lhs); return lhs }

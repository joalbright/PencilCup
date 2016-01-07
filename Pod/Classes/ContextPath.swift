//
//  ContextPath.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

/// Move To Point Operator
infix operator ->- { associativity left precedence 200 }


/// CGContext Move To Point
public func ->- (lhs: CGContextRef?, rhs: TPoint) -> CGContextRef? {
    
    CGContextMoveToPoint(lhs, rhs.x, rhs.y); return lhs
    
}

/// CGContext Move To Point
public func ->- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? {
    
    CGContextMoveToPoint(lhs, rhs.x, rhs.y); return lhs
    
}


/// Add Line To Point Operator
infix operator -+- { associativity left precedence 200 }


/// CGContext Add Line To Point
public func -+- (lhs: CGContextRef?, rhs: TPoint) -> CGContextRef? {
    
    CGContextAddLineToPoint(lhs, rhs.x, rhs.y); return lhs
    
}

/// CGContext Add Line To Point
public func -+- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? {
    
    CGContextAddLineToPoint(lhs, rhs.x, rhs.y); return lhs
    
}


/// Add Curve To Point Operator
infix operator -~- { associativity left precedence 200 }


/// Add Curve To Point
public func -~- (lhs: CGContextRef?, rhs: (TPoint, TPoint, TPoint)) -> CGContextRef? {
    
    lhs -~- (rhs.0.x,rhs.0.y,rhs.1.x,rhs.1.y,rhs.2.x,rhs.2.y); return lhs
    
}

/// Add Curve To Point
public func -~- (lhs: CGContextRef?, rhs: (CGPoint,CGPoint,CGPoint)) -> CGContextRef? {
    
    lhs -~- (rhs.0.x,rhs.0.y,rhs.1.x,rhs.1.y,rhs.2.x,rhs.2.y); return lhs
    
}

/// Add Curve To Point
public func -~- (lhs: CGContextRef?, rhs: (CGFloat,CGFloat,CGFloat,CGFloat,CGFloat,CGFloat)) -> CGContextRef? {
    
    CGContextAddCurveToPoint(lhs,rhs.0,rhs.1,rhs.2,rhs.3,rhs.4,rhs.5); return lhs
    
}


/// Dot Operator 
/// - description : Line with start and end points that are equal with a stroke width and round cap.
infix operator -•- { associativity left precedence 200 }

/// CGContext Create Dot : Diameter = Stroke Width
public func -•- (lhs: CGContextRef?, rhs: TPoint) -> CGContextRef? {
    
    return lhs ->- rhs -+- rhs -□ nil

}

/// CGContext Create Dot : Diameter = Stroke Width
public func -•- (lhs: CGContextRef?, rhs: CGPoint) -> CGContextRef? {
    
    return lhs ->- rhs -+- rhs -□ nil

}


/// Fill Path Operator
infix operator -■ { associativity left precedence 200 }

/// CGContext Fill Path
/// - discussion : rhs may change in the future ... currently used with nil to end
public func -■ (lhs: CGContextRef?, rhs: AnyObject?) -> CGContextRef? {
    
    CGContextFillPath(lhs); return lhs

}


/// Stroke Path Operator
infix operator -□ { associativity left precedence 200 }

/// CGContext Stroke Path
/// - discussion : rhs may change in the future ... currently used with nil to end
public func -□ (lhs: CGContextRef?, rhs: AnyObject?) -> CGContextRef? {
    
    CGContextStrokePath(lhs); return lhs

}




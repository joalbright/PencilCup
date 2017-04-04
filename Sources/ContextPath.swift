//
//  ContextPath.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit


/// Move To Point Operator
infix operator ->- : AdditionPrecedence

/// CGContext Move To Point
func ->- (lhs: CGContext?, rhs: CGPoint) -> CGContext? {
    
    lhs?.move(to: rhs); return lhs
    
}

func ->- (lhs: CGContext?, rhs: TPoint) -> CGContext? {
    
    lhs?.move(to: CGPoint(x: rhs.x, y: rhs.y)); return lhs
    
}


/// Add Line To Point Operator
infix operator -+- : AdditionPrecedence

/// CGContext Add Line To Point
func -+- (lhs: CGContext?, rhs: CGPoint) -> CGContext? {
    
    lhs?.addLine(to: rhs); return lhs

}

func -+- (lhs: CGContext?, rhs: TPoint) -> CGContext? {
    
    lhs?.addLine(to: CGPoint(x: rhs.x, y: rhs.y)); return lhs
    
}


/// Add Curve To Point Operator
infix operator -~- : AdditionPrecedence

/// Add Curve To Point
func -~- (lhs: CGContext?, rhs: (CGPoint,CGPoint,CGPoint)) -> CGContext? {
    
    lhs?.addCurve(to: rhs.2, control1: rhs.0, control2: rhs.1); return lhs
    
}

func -~- (lhs: CGContext?, rhs: (TPoint,TPoint,TPoint)) -> CGContext? {
    
    lhs?.addCurve(to: CGPoint(x: rhs.2.x, y: rhs.2.y), control1: CGPoint(x: rhs.0.x, y: rhs.0.y), control2: CGPoint(x: rhs.1.x, y: rhs.1.y)); return lhs
    
}

func -~- (lhs: CGContext?, rhs: (CGFloat,CGFloat,CGFloat,CGFloat,CGFloat,CGFloat)) -> CGContext? {
    
    lhs?.addCurve(to: CGPoint(x: rhs.4, y: rhs.5), control1: CGPoint(x: rhs.0, y: rhs.1), control2: CGPoint(x: rhs.2, y: rhs.3)); return lhs
    
}


/// Dot Operator 
/// - description : Line with start and end points that are equal with a stroke width and round cap.
infix operator -•- : AdditionPrecedence

/// CGContext Create Dot : Diameter = Stroke Width
func -•- (lhs: CGContext?, rhs: CGPoint) -> CGContext? {
    
    return lhs ->- rhs -+- rhs -□ nil

}


/// Fill Path Operator
infix operator -■ : AdditionPrecedence

/// CGContext Fill Path
/// - discussion : rhs gets set before fill
func -■ (lhs: CGContext?, rhs: CGColor?) -> CGContext? {

    if let rhs = rhs { lhs?.setFillColor(rhs) }
    lhs?.fillPath(); return lhs

}


/// Stroke Path Operator
infix operator -□ : AdditionPrecedence

/// CGContext Stroke Path
/// - discussion : rhs gets set before stroke
func -□ (lhs: CGContext?, rhs: CGColor?) -> CGContext? {
    
    if let rhs = rhs { lhs?.setStrokeColor(rhs) }
    lhs?.strokePath(); return lhs

}




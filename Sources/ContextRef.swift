//
//  ContextRef.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit


// MARK: - Context : Settings

public extension CGContext {
    
    var boundingBox: CGRect { return boundingBoxOfPath }
    var currenCGPoint: CGPoint { return currentPointOfPath }
    
    /// Sets lineCap and lineJoin to .Round
    func round() -> CGContext? {
        
        setLineCap(.round); setLineJoin(.round); return self
    
    }
    
    /// Sets stroke and fill color
    func color(_ color: CGColor?) -> CGContext? {
        
        guard let color = color else { return self }
        setFillColor(color)
        setStrokeColor(color)
        return self
        
    }
    
    /// Sets lineWidth
    func line(_ width: CGFloat) -> CGContext? { setLineWidth(width); return self }
    
    /// Sets blendMode
    func blend(_ mode: CGBlendMode) -> CGContext? { setBlendMode(mode); return self }
    
    /// Sets alpha
    func alpha(_ alpha: CGFloat) -> CGContext? { setAlpha(alpha); return self }
    
    /// Sets flatness
    func flatness(_ flatness: CGFloat) -> CGContext? { setFlatness(flatness); return self }
    
    func containsPoint(_ x: CGFloat, _ y: CGFloat) -> Bool { return pathContains(CGPoint(x: x, y: y), mode: .fill) }
    
    func containsPoint(_ point: CGPoint) -> Bool { return pathContains(point, mode: .fill) }
    
}


// MARK: - Context : Scale, Rotate, & Offset

public extension CGContext {
    
    /// Rotates by angle
    func rotate(_ angle: CGFloat) -> CGContext? { rotate(by: angle); return self }
    
    /// Translates origin by x,y
    func offset(_ x: CGFloat, _ y: CGFloat) -> CGContext? { translateBy(x: x, y: y); return self }
    
    /// Translates origin by point
    func offset(_ point: CGPoint) -> CGContext? { translateBy(x: point.x, y: point.y); return self }
    
    /// Scales both x & y by xy
    func scale(_ xy: CGFloat = 1) -> CGContext? { scaleBy(x: xy, y: xy); return self }
    
    /// Scales by x & y
    func scale(_ x: CGFloat, _ y: CGFloat) -> CGContext? { scaleBy(x: x, y: y); return self }
    
    /// Scales x & y by scale
    func scale(_ scale: TScale) -> CGContext? { scaleBy(x: scale.x, y: scale.y); return self }
    
}

// MARK: - Context : Fill, Stroke, & Clear

public extension CGContext {
    
    /// Clears with rect
    func clear(_ rect: CGRect? = nil) -> CGContext? {
        
        clear(rect ?? CGRect(x: 0, y: 0, width: 2048, height: 2048)); return self
    
    }
    
    /// Strokes available path
    func stroke() -> CGContext? { strokePath(); return self }
    
    /// Fills available path
    func fill() -> CGContext? { fillPath(); return self }
    
}

// MARK: - Context : Add to Path

public extension CGContext {
    
    /// Add rect(s) to path
    func rect(_ rects: CGRect...) -> CGContext? {
        
        for rect in rects { addRect(rect) }; return self
    
    }
    
    /// Add ellipse(s) in rect to path
    func ellipse(_ rects: CGRect...) -> CGContext? {
        
        for rect in rects { addEllipse(in: rect) }; return self
    
    }
    
    /// Add circle with center as c and radius of r to path
    func circle(_ c: CGPoint, r: CGFloat) -> CGContext? {
        
        addEllipse(in: CGRect(origin: c - CGPoint(x: r, y: r), size: CGSize(width: r, height: r) * 2)); return self
    
    }
    
    /// Move path to x,y
    func m(_ x: CGFloat, _ y: CGFloat) -> CGContext? {
        
        move(to: CGPoint(x: x, y: y)); return self
        
    }
    
    /// Move to point
    func m(_ point: CGPoint) -> CGContext? {
        
        move(to: point); return self
        
    }
    
    /// Add line to x,y
    func l(_ x: CGFloat, _ y: CGFloat) -> CGContext? {
        
        addLine(to: CGPoint(x: x, y: y)); return self
        
    }
    
    /// Add line(s) to point(s)
    func l(_ points: CGPoint...) -> CGContext? {
        
        for point in points { addLine(to: point) }; return self
        
    }
    
    /// Add curve to curve point with curve anchors
    func c(_ curve: (CGPoint,CGPoint,CGPoint)) -> CGContext? {
        
        addCurve(to: curve.2, control1: curve.0, control2: curve.1); return self
        
    }
    
    /// Dot with center of x,y and diameter of strokeWidth
    func d(_ x: CGFloat, _ y: CGFloat) -> CGContext? {
        
        return m(x,y)?.l(x,y)?.stroke()
        
    }
    
    /// Dot(s) with center of point(s) and diameter of strokeWidth
    func d(_ points: CGPoint...) -> CGContext? {
        
        for point in points { _ = m(point)?.l(point)?.stroke() }; return self
        
    }
    
}




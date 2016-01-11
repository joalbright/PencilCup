//
//  ContextRef.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//


import Foundation


// MARK: - Context : Settings

public extension CGContextRef {
    
    var boundingBox: CGRect { return CGContextGetPathBoundingBox(self) }
    var currentPoint: CGPoint { return CGContextGetPathCurrentPoint(self) }
    var isPathEmpty: Bool { return CGContextIsPathEmpty(self) }
    
    /// Sets lineCap and lineJoin to .Round
    func round() -> CGContextRef? {
        
        CGContextSetLineCap(self, .Round); CGContextSetLineJoin(self, .Round); return self
    
    }
    
    /// Sets stroke and fill color
    func color(color: CGColorRef?) -> CGContextRef? {
        
        CGContextSetStrokeColorWithColor(self, color)
        CGContextSetFillColorWithColor(self, color)
        return self
        
    }
    
    /// Sets lineWidth
    func line(width: CGFloat) -> CGContextRef? {
        
        CGContextSetLineWidth(self, width); return self
        
    }
    
    /// Sets blendMode
    func blend(mode: CGBlendMode) -> CGContextRef? {
        
        CGContextSetBlendMode(self, mode); return self
        
    }
    
    /// Sets alpha
    func alpha(alpha: CGFloat) -> CGContextRef? {
        
        CGContextSetAlpha(self, alpha); return self
        
    }
    
    /// Sets flatness
    func flatness(flatness: CGFloat) -> CGContextRef? {
        
        CGContextSetFlatness(self, flatness); return self
        
    }
    
    func containsPoint(x: CGFloat, _ y: CGFloat) -> Bool {
        
        return CGContextPathContainsPoint(self, CGPoint(x: x, y: y), .Fill)
        
    }
    
    func containsPoint(point: CGPoint) -> Bool {
        
        return CGContextPathContainsPoint(self, point, .Fill)
        
    }
    
    func containsPoint(point: TPoint) -> Bool {
        
        return CGContextPathContainsPoint(self, CGPoint(x: point.x, y: point.y), .Fill)
        
    }
    
}


// MARK: - Context : Scale, Rotate, & Offset

public extension CGContextRef {
    
    /// Rotates by angle
    func rotate(angle: CGFloat) -> CGContextRef? {
        
        CGContextRotateCTM(self, angle); return self
        
    }
    
    /// Translates origin by x,y
    func offset(x: CGFloat, _ y: CGFloat) -> CGContextRef? {
        
        CGContextTranslateCTM(self, x, y); return self
        
    }
    
    /// Translates origin by point
    func offset(point: CGPoint) -> CGContextRef? {
        
        CGContextTranslateCTM(self, point.x, point.y); return self
        
    }
    
    /// Translates origin by point
    func offset(point: TPoint) -> CGContextRef? {
        
        CGContextTranslateCTM(self, point.x, point.y); return self
        
    }
    
    /// Scales both x & y by xy
    func scale(xy: CGFloat = 1) -> CGContextRef? {
        
        CGContextScaleCTM(self, xy, xy); return self
        
    }
    
    /// Scales by x & y
    func scale(x: CGFloat, _ y: CGFloat) -> CGContextRef? {
        
        CGContextScaleCTM(self, x, y); return self
        
    }
    
    /// Scales x & y by scale
    func scale(scale: TScale) -> CGContextRef? {
        
        CGContextScaleCTM(self, scale.x, scale.y); return self
        
    }
    
}

// MARK: - Context : Fill, Stroke, & Clear

public extension CGContextRef {
    
    /// Clears with rect
    func clear(rect: CGRect? = nil) -> CGContextRef? {
        
        CGContextClearRect(self, rect ?? CGRect(0, 0, 2048, 2048)) ;return self
    
    }
    
    /// Strokes available path
    func stroke() -> CGContextRef? {
        
        CGContextStrokePath(self); return self
    
    }
    
    /// Fills available path
    func fill() -> CGContextRef? {
        
        CGContextFillPath(self); return self
    
    }
    
}

// MARK: - Context : Add to Path

public extension CGContextRef {
    
    /// Add rect(s) to path
    func rect(rects: CGRect...) -> CGContextRef? {
        
        for rect in rects { CGContextAddRect(self, rect) }; return self
    
    }
    
    /// Add ellipse(s) in rect to path
    func ellipse(rects: CGRect...) -> CGContextRef? {
        
        for rect in rects { CGContextAddEllipseInRect(self, rect) }; return self
    
    }
    
    /// Add circle with center as c and radius of r to path
    func circle(c: CGPoint, r: CGFloat) -> CGContextRef? {
        
        CGContextAddEllipseInRect(self, CGRect(c - (r,r), (r,r) * 2)); return self
    
    }
    
    /// Move path to x,y
    func m(x: CGFloat, _ y: CGFloat) -> CGContextRef? {
        
        CGContextMoveToPoint(self, x, y); return self
        
    }
    
    /// Move to point
    func m(point: CGPoint) -> CGContextRef? {
        
        CGContextMoveToPoint(self, point.x, point.y); return self
        
    }
    
    /// Move to point
    func m(point: TPoint) -> CGContextRef? {
        
        CGContextMoveToPoint(self, point.x, point.y); return self
        
    }
    
    /// Add line to x,y
    func l(x: CGFloat, _ y: CGFloat) -> CGContextRef? {
        
        CGContextAddLineToPoint(self, x, y); return self
        
    }
    
    /// Add line(s) to point(s)
    func l(points: CGPoint...) -> CGContextRef? {
        
        for point in points { CGContextAddLineToPoint(self, point.x, point.y) }; return self
        
    }
    
    /// Add line(s) to point(s)
    func l(points: TPoint...) -> CGContextRef? {
        
        for point in points { CGContextAddLineToPoint(self, point.x, point.y) }; return self
        
    }
    
    /// Add curve to curve point with curve anchors
    func c(curve: TCurve) -> CGContextRef? {
        
        CGContextAddCurveToPoint(self, curve.a1.x, curve.a1.y, curve.a2.x, curve.a2.y, curve.p.x, curve.p.y); return self
        
    }
    
    /// Add curve to curve point with curve anchors
    func c(curve: (CGPoint,CGPoint,CGPoint)) -> CGContextRef? {
        
        CGContextAddCurveToPoint(self, curve.0.x, curve.0.y, curve.1.x, curve.1.y, curve.2.x, curve.2.y); return self
        
    }
    
    /// Add curve to curve point with curve anchors
    func c(a1x: CGFloat, _ a1y: CGFloat, _ a2x: CGFloat, _ a2y: CGFloat, _ px: CGFloat, _ py: CGFloat) -> CGContextRef? {
        
        CGContextAddCurveToPoint(self, a1x, a1y, a2x, a2y, px, py); return self
        
    }
    
    /// Dot with center of x,y and diameter of strokeWidth
    func d(x: CGFloat, _ y: CGFloat) -> CGContextRef? {
        
        self.m(x,y)?.l(x,y)?.stroke(); return self
        
    }
    
    /// Dot(s) with center of point(s) and diameter of strokeWidth
    func d(points: CGPoint...) -> CGContextRef? {
        
        for point in points { self.m(point)?.l(point)?.stroke() }; return self
        
    }
    
    /// Dot(s) with center of point(s) and diameter of strokeWidth
    func d(points: TPoint...) -> CGContextRef? {
        
        for point in points { self.m(point)?.l(point)?.stroke() }; return self
        
    }
    
}




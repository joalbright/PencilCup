//
//  Types.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

typealias PCPoint = (x: CGFloat, y: CGFloat)
typealias PCSize = (width: CGFloat, height: CGFloat)
typealias PCScale = (x: CGFloat, y: CGFloat)
typealias PCDelta = (dx: CGFloat, dy: CGFloat)

// MARK: - CGRect

extension CGRect {
    
    func inset(d: CGFloat) -> CGRect { return CGRectInset(self, d, d) }
    func inset(dx: CGFloat, _ dy: CGFloat) -> CGRect { return CGRectInset(self, dx, dy) }
    
}

func CGRect(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect { return CGRectMake(x, y, width, height) }
func CGRect(origin: CGPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect { return CGRect(origin.x, origin.y, width, height) }
func CGRect(origin: PCPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect { return CGRect(origin.x, origin.y, width, height) }
func CGRect(origin: PCPoint, _ size: PCSize) -> CGRect { return CGRect(origin.x, origin.y, size.width, size.height) }
func CGRect(origin: CGPoint, _ size: PCSize) -> CGRect { return CGRect(origin.x, origin.y, size.width, size.height) }

// MARK: - CGContext

extension CGContextRef {
    
    func round() -> CGContextRef? { CGContextSetLineCap(self, .Round); CGContextSetLineJoin(self, .Round); return self }
    func clear(rect: CGRect? = nil) -> CGContextRef? { CGContextClearRect(self, rect ?? UIScreen.mainScreen().bounds) ;return self }
    
    func color(color: UIColor) -> CGContextRef? { color.set(); return self }
    func stroke() -> CGContextRef? { CGContextStrokePath(self); return self }
    func fill() -> CGContextRef? { CGContextFillPath(self); return self }
    
    func line(width: CGFloat) -> CGContextRef? { CGContextSetLineWidth(self, width); return self }
    func blend(mode: CGBlendMode) -> CGContextRef? { CGContextSetBlendMode(self, mode); return self }
    func alpha(alpha: CGFloat) -> CGContextRef? { CGContextSetAlpha(self, alpha); return self }
    func flatness(amount: CGFloat) -> CGContextRef? { CGContextSetFlatness(self, amount); return self }
    
    func offset(x: CGFloat, _ y: CGFloat) -> CGContextRef? { CGContextTranslateCTM(self, x, y); return self }
    func offset(point: CGPoint) -> CGContextRef? { CGContextTranslateCTM(self, point.x, point.y); return self }
    func offset(point: PCPoint) -> CGContextRef? { CGContextTranslateCTM(self, point.x, point.y); return self }
    func scale(x: CGFloat, _ y: CGFloat) -> CGContextRef? { CGContextScaleCTM(self, x, y); return self }
    func scale(xy: CGFloat = 1) -> CGContextRef? { CGContextScaleCTM(self, xy, xy); return self }
    
    func rect(rect: CGRect) -> CGContextRef? { CGContextAddRect(self, rect); return self }
    func ellipse(rects: CGRect...) -> CGContextRef? { for rect in rects { CGContextAddEllipseInRect(self, rect) }; return self }
    func circle(c: CGPoint, r: CGFloat) -> CGContextRef? { CGContextAddEllipseInRect(self, CGRect(c - (r,r), (r,r) * 2)); return self }
    
}

func UIGraphicsGetCurrentContext() -> CGContextRef? { return UIKit.UIGraphicsGetCurrentContext()?.round() }

//
//  ContextPoint.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import Foundation
import Inlinit

extension CGPoint: Inlinit {
    
    var tuple: TPoint {
        
        return (x,y)
        
    }
    
}

public struct CGLine: Inlinit {
    
    public var points: [CGPoint] = []
    public var strokeWidth: CGFloat = 0
    
    public var fill: CGColorRef?
    public var stroke: CGColorRef?
    
    public init() { }
    
    public func drawPoints(context: CGContextRef?) -> CGContextRef? {
        
        for (p,point) in points.enumerate() {
            
            if point == CGPointZero { continue }
            _ = p == 0 ? { context ->- point }() : { context -+- point }()
            
        }
        
        return context
        
    }
    
}
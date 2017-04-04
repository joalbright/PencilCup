//
//  ContexCGPoint.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

extension CGPoint: Inlinit { }

public struct CGLine: Inlinit {
    
    public var points: [CGPoint] = []
    public var strokeWidth: CGFloat = 0
    
    public var fill: CGColor?
    public var stroke: CGColor?
    
    public init() { }
    
    public func drawPoints(_ context: CGContext?) -> CGContext? {
        
        for (p,point) in points.enumerated() {
            
            if point == .zero { continue }
            _ = p == 0 ? { context ->- point }() : { context -+- point }()
            
        }
        
        return context
        
    }
    
}

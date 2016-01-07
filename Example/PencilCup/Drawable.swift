//
//  Drawable.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit
import PencilCup

public protocol Drawable {
    
}

extension Drawable {
    
    public func drawLines(context: CGContextRef?, lines: [CGLine]) {
        
        context?.round()
        
        for line in lines {
            
            line.drawPoints(context?.color(line.fill))?.fill()
            line.drawPoints(context?.color(line.stroke))?.line(line.strokeWidth)?.stroke()
            
        }
        
    }
    
}

//
//  Drawable.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

public protocol Drawable {
    
}

extension Drawable {
    
    public func drawLines(_ context: CGContext?, lines: [CGLine]) {
        
        _ = context?.round()
        
        for line in lines {
            
            _ = line.drawPoints(context?.color(line.fill))?.fill()
            _ = line.drawPoints(context?.color(line.stroke))?.line(line.strokeWidth)?.stroke()
            
        }
        
    }
    
}

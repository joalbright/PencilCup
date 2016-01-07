//
//  Drawable.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

public protocol Drawable {

    func drawLines(lines: [CGLine])
    
}

extension UIView: Drawable {
    
    public func drawLines(lines: [CGLine]) {
        
        let context = UIGraphicsGetCurrentContext()?.round()
        
        for line in lines {
            
            line.drawPoints(context?.color(line.fill))?.fill()
            line.drawPoints(context?.color(line.stroke))?.line(line.strokeWidth)?.stroke()
            
        }
        
    }
    
}

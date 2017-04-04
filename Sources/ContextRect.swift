//
//  ContextRect.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

extension CGRect {
    
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
    
    /// Inset all four sides with d
    func inset(_ d: CGFloat) -> CGRect {
        
        return insetBy(dx: d, dy: d)
    
    }
    
    func pointOnCircleInRect(_ degree: CGFloat) -> CGPoint {
        
        return CGPoint {
            
            $0.x = (width) * cos(degree * CGFloat(M_PI / 180)) / 2 + center.x
            $0.y = (height) * sin(degree * CGFloat(M_PI / 180)) / 2 + center.y
            
        }
        
    }
    
}

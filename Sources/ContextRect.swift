//
//  ContextRect.swift
//  PencilCup
//
//  Created by Jo Albright on 1/4/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import Foundation

public extension CGRect {
    
    var center: CGPoint { return CGPoint(x: CGRectGetMidX(self), y: CGRectGetMidY(self)) }
    
    /// Inset all four sides with d
    func inset(d: CGFloat) -> CGRect {
        
        return CGRectInset(self, d, d)
    
    }
    
    func inset(dx: CGFloat, _ dy: CGFloat) -> CGRect {
        
        return CGRectInset(self, dx, dy)
    
    }
    
    func pointOnCircleInRect(degree: CGFloat) -> CGPoint {
        
        return CGPoint {
            
            $0.x = (width) * cos(degree * CGFloat(M_PI / 180)) / 2 + center.x
            $0.y = (height) * sin(degree * CGFloat(M_PI / 180)) / 2 + center.y
            
        }
        
    }
    
}

public func CGRect(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRectMake(x, y, width, height)

}

public func CGRect(origin: CGPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRect(origin.x, origin.y, width, height)

}

public func CGRect(origin: TPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRect(origin.x, origin.y, width, height)

}

public func CGRect(origin: TPoint, _ size: TSize) -> CGRect {
    
    return CGRect(origin.x, origin.y, size.width, size.height)

}


public func CGRect(origin: CGPoint, _ size: TSize) -> CGRect {
    
    return CGRect(origin.x, origin.y, size.width, size.height)

}

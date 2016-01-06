//
//  Rect.swift
//  Pods
//
//  Created by Jo Albright on 1/6/16.
//
//

import Foundation


public extension CGRect {
    
    func inset(d: CGFloat) -> CGRect {
        
        return CGRectInset(self, d, d)
    
    }
    
    func inset(dx: CGFloat, _ dy: CGFloat) -> CGRect {
        
        return CGRectInset(self, dx, dy)
    
    }
    
}

public func CGRect(x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRectMake(x, y, width, height)

}

public func CGRect(origin: CGPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRect(origin.x, origin.y, width, height)

}

public func CGRect(origin: PCPoint, _ width: CGFloat, _ height: CGFloat) -> CGRect {
    
    return CGRect(origin.x, origin.y, width, height)

}

public func CGRect(origin: PCPoint, _ size: PCSize) -> CGRect {
    
    return CGRect(origin.x, origin.y, size.width, size.height)

}


public func CGRect(origin: CGPoint, _ size: PCSize) -> CGRect {
    
    return CGRect(origin.x, origin.y, size.width, size.height)

}

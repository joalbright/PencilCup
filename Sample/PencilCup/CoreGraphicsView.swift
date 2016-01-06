//
//  CoreGraphicsView.swift
//  PencilCup
//
//  Created by Jo Albright on 1/5/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

@IBDesignable class CoreGraphicsView: UIView {
    
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        UIColor(white: 0.9, alpha: 1).set()
        
        CGContextFillRect(context, rect)
        
        UIColor(white: 0.2, alpha: 1).set()
        
        CGContextSetLineCap(context,.Round)
        CGContextSetLineJoin(context,.Round)
        CGContextSetLineWidth(context,1)
        CGContextTranslateCTM(context,(rect.width - 188) / 2, (rect.height - 300) / 2)
        
        CGContextMoveToPoint(context,126.01,89.44)
        CGContextAddCurveToPoint(context,116.37,89.19,105.65,89.06,94.35,89.06)
        CGContextAddCurveToPoint(context,52.35,89.06,18.3,90.8,18.3,94.24)
        CGContextAddCurveToPoint(context,18.3,97.68,52.35,101.51,94.35,101.51)
        CGContextAddCurveToPoint(context,104.7,101.51,114.57,101.28,123.57,100.87)
        CGContextAddLineToPoint(context,126.01,89.44)
        CGContextFillPath(context)
        
        CGContextMoveToPoint(context,140,99.75)
        CGContextAddLineToPoint(context,150.28,49.72)
        CGContextAddCurveToPoint(context,150.5,48.64,151.56,47.94,152.64,48.17)
        CGContextAddLineToPoint(context,162.37,50.18)
        CGContextAddCurveToPoint(context,163.46,50.4,164.15,51.46,163.93,52.54)
        CGContextAddLineToPoint(context,154.43,98.52)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,159.39,13.91)
        CGContextAddCurveToPoint(context,160.85,14.62,162.41,15.16,164.07,15.5)
        CGContextAddCurveToPoint(context,165.71,15.84,167.36,15.97,168.96,15.9)
        CGContextAddCurveToPoint(context,170.55,15.83,171.69,14.33,171.39,12.77)
        CGContextAddLineToPoint(context,169.3,2.12)
        CGContextAddCurveToPoint(context,168.85,-0.16,165.88,-0.78,164.56,1.14)
        CGContextAddLineToPoint(context,158.41,10.08)
        CGContextAddCurveToPoint(context,157.51,11.39,157.96,13.22,159.39,13.91)
        CGContextFillPath(context)
        
        CGContextMoveToPoint(context,159.39,13.91)
        CGContextAddCurveToPoint(context,160.85,14.62,162.41,15.16,164.07,15.5)
        CGContextAddCurveToPoint(context,165.71,15.84,167.36,15.97,168.96,15.9)
        CGContextAddCurveToPoint(context,170.55,15.83,171.69,14.33,171.39,12.77)
        CGContextAddLineToPoint(context,169.3,2.12)
        CGContextAddCurveToPoint(context,168.85,-0.16,165.88,-0.78,164.56,1.14)
        CGContextAddLineToPoint(context,158.41,10.08)
        CGContextAddCurveToPoint(context,157.51,11.39,157.96,13.22,159.39,13.91)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,137.79,100.12)
        CGContextAddLineToPoint(context,148.47,48.45)
        CGContextAddCurveToPoint(context,148.64,47.62,148.27,46.77,147.54,46.33)
        CGContextAddLineToPoint(context,141.06,42.43)
        CGContextAddCurveToPoint(context,139.87,41.72,138.35,42.39,138.07,43.74)
        CGContextAddLineToPoint(context,126.28,100.81)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,158.41,10.08)
        CGContextAddLineToPoint(context,140.27,38.9)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,176.92,46.09)
        CGContextAddLineToPoint(context,171.39,12.77)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,167.6,96.07)
        CGContextAddLineToPoint(context,176.74,51.79)
        CGContextAddCurveToPoint(context,177.02,50.42,175.86,49.2,174.48,49.4)
        CGContextAddLineToPoint(context,167.77,50.43)
        CGContextAddCurveToPoint(context,166.94,50.55,166.28,51.18,166.11,52)
        CGContextAddLineToPoint(context,156.58,98.15)
        CGContextStrokePath(context)
        
        CGContextMoveToPoint(context,30.06,218.44)
        CGContextAddCurveToPoint(context,30.06,221.19,27.83,223.42,25.08,223.42)
        CGContextAddLineToPoint(context,24.83,223.42)
        CGContextAddCurveToPoint(context,22.08,223.42,19.84,221.19,19.84,218.44)
        CGContextAddLineToPoint(context,19.84,138.67)
        CGContextAddCurveToPoint(context,19.84,135.92,22.08,133.69,24.83,133.69)
        CGContextAddLineToPoint(context,25.08,133.69)
        CGContextAddCurveToPoint(context,27.83,133.69,30.06,135.92,30.06,138.67)
        CGContextAddLineToPoint(context,30.06,218.44)
        
        CGContextMoveToPoint(context,174.9,100.03)
        CGContextAddCurveToPoint(context,161.84,103.04,137.31,106.55,94,106.55)
        CGContextAddCurveToPoint(context,50.69,106.55,26.17,103.04,13.1,100.03)
        CGContextAddCurveToPoint(context,6.38,98.48,-0.04,103.61,-0.04,110.51)
        CGContextAddLineToPoint(context,-0.04,274.38)
        CGContextAddCurveToPoint(context,-0.04,281.03,4.04,286.99,10.23,289.4)
        CGContextAddCurveToPoint(context,22.22,294.07,46.74,300,94,300)
        CGContextAddCurveToPoint(context,141.26,300,165.78,294.07,177.77,289.4)
        CGContextAddCurveToPoint(context,183.96,286.99,188.04,281.03,188.04,274.38)
        CGContextAddLineToPoint(context,188.04,110.51)
        CGContextAddCurveToPoint(context,188.04,103.61,181.62,98.48,174.9,100.03)
        CGContextFillPath(context)
        
    }
    
}
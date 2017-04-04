//
//  CoreGraphicsView.swift
//  PencilCup
//
//  Created by Jo Albright on 1/5/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

import UIKit

@IBDesignable class CoreGraphicsView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        UIColor(white: 0.9, alpha: 1).set()
        
        context?.fill(rect)
        
        UIColor(white: 0.2, alpha: 1).set()
        
        context?.setLineCap(.round)
        context?.setLineJoin(.round)
        context?.setLineWidth(1)
        context?.translateBy(x: (rect.width - 188) / 2, y: (rect.height - 300) / 2)
        
//        context?.move(to: CGPoint(x: 126.01, y: 89.44))
//        context?.addCurve(to: CGPoint(x: 94.35, y: 89.06), control1: CGPoint(x: 116.37, y: 89.19), control2: CGPoint(x: 105.65, y: 89.06))
//        CGContextAddCurveToPoint(context,52.35,89.06,18.3,90.8,18.3,94.24)
//        CGContextAddCurveToPoint(context,18.3,97.68,52.35,101.51,94.35,101.51)
//        CGContextAddCurveToPoint(context,104.7,101.51,114.57,101.28,123.57,100.87)
//        context?.addLine(to: CGPoint(x: 126.01, y: 89.44))
//        context?.fillPath()
//        
//        context?.move(to: CGPoint(x: 140, y: 99.75))
//        context?.addLine(to: CGPoint(x: 150.28, y: 49.72))
//        CGContextAddCurveToPoint(context,150.5,48.64,151.56,47.94,152.64,48.17)
//        context?.addLine(to: CGPoint(x: 162.37, y: 50.18))
//        CGContextAddCurveToPoint(context,163.46,50.4,164.15,51.46,163.93,52.54)
//        context?.addLine(to: CGPoint(x: 154.43, y: 98.52))
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 159.39, y: 13.91))
//        CGContextAddCurveToPoint(context,160.85,14.62,162.41,15.16,164.07,15.5)
//        CGContextAddCurveToPoint(context,165.71,15.84,167.36,15.97,168.96,15.9)
//        CGContextAddCurveToPoint(context,170.55,15.83,171.69,14.33,171.39,12.77)
//        context?.addLine(to: CGPoint(x: 169.3, y: 2.12))
//        CGContextAddCurveToPoint(context,168.85,-0.16,165.88,-0.78,164.56,1.14)
//        context?.addLine(to: CGPoint(x: 158.41, y: 10.08))
//        CGContextAddCurveToPoint(context,157.51,11.39,157.96,13.22,159.39,13.91)
//        context?.fillPath()
//        
//        context?.move(to: CGPoint(x: 159.39, y: 13.91))
//        CGContextAddCurveToPoint(context,160.85,14.62,162.41,15.16,164.07,15.5)
//        CGContextAddCurveToPoint(context,165.71,15.84,167.36,15.97,168.96,15.9)
//        CGContextAddCurveToPoint(context,170.55,15.83,171.69,14.33,171.39,12.77)
//        context?.addLine(to: CGPoint(x: 169.3, y: 2.12))
//        CGContextAddCurveToPoint(context,168.85,-0.16,165.88,-0.78,164.56,1.14)
//        context?.addLine(to: CGPoint(x: 158.41, y: 10.08))
//        CGContextAddCurveToPoint(context,157.51,11.39,157.96,13.22,159.39,13.91)
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 137.79, y: 100.12))
//        context?.addLine(to: CGPoint(x: 148.47, y: 48.45))
//        CGContextAddCurveToPoint(context,148.64,47.62,148.27,46.77,147.54,46.33)
//        context?.addLine(to: CGPoint(x: 141.06, y: 42.43))
//        CGContextAddCurveToPoint(context,139.87,41.72,138.35,42.39,138.07,43.74)
//        context?.addLine(to: CGPoint(x: 126.28, y: 100.81))
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 158.41, y: 10.08))
//        context?.addLine(to: CGPoint(x: 140.27, y: 38.9))
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 176.92, y: 46.09))
//        context?.addLine(to: CGPoint(x: 171.39, y: 12.77))
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 167.6, y: 96.07))
//        context?.addLine(to: CGPoint(x: 176.74, y: 51.79))
//        CGContextAddCurveToPoint(context,177.02,50.42,175.86,49.2,174.48,49.4)
//        context?.addLine(to: CGPoint(x: 167.77, y: 50.43))
//        CGContextAddCurveToPoint(context,166.94,50.55,166.28,51.18,166.11,52)
//        context?.addLine(to: CGPoint(x: 156.58, y: 98.15))
//        context?.strokePath()
//        
//        context?.move(to: CGPoint(x: 30.06, y: 218.44))
//        CGContextAddCurveToPoint(context,30.06,221.19,27.83,223.42,25.08,223.42)
//        context?.addLine(to: CGPoint(x: 24.83, y: 223.42))
//        CGContextAddCurveToPoint(context,22.08,223.42,19.84,221.19,19.84,218.44)
//        context?.addLine(to: CGPoint(x: 19.84, y: 138.67))
//        CGContextAddCurveToPoint(context,19.84,135.92,22.08,133.69,24.83,133.69)
//        context?.addLine(to: CGPoint(x: 25.08, y: 133.69))
//        CGContextAddCurveToPoint(context,27.83,133.69,30.06,135.92,30.06,138.67)
//        context?.addLine(to: CGPoint(x: 30.06, y: 218.44))
//        
//        context?.move(to: CGPoint(x: 174.9, y: 100.03))
//        CGContextAddCurveToPoint(context,161.84,103.04,137.31,106.55,94,106.55)
//        CGContextAddCurveToPoint(context,50.69,106.55,26.17,103.04,13.1,100.03)
//        CGContextAddCurveToPoint(context,6.38,98.48,-0.04,103.61,-0.04,110.51)
//        context?.addLine(to: CGPoint(x: -0.04, y: 274.38))
//        CGContextAddCurveToPoint(context,-0.04,281.03,4.04,286.99,10.23,289.4)
//        CGContextAddCurveToPoint(context,22.22,294.07,46.74,300,94,300)
//        CGContextAddCurveToPoint(context,141.26,300,165.78,294.07,177.77,289.4)
//        CGContextAddCurveToPoint(context,183.96,286.99,188.04,281.03,188.04,274.38)
//        context?.addLine(to: CGPoint(x: 188.04, y: 110.51))
//        CGContextAddCurveToPoint(context,188.04,103.61,181.62,98.48,174.9,100.03)
//        context?.fillPath()
        
    }
    
}

//
//  DrawView.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class DrawView: UIView, Drawable {
    
    var lines: [CGLine] = [] { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        
        drawLines(UIGraphicsGetCurrentContext(), lines: lines)
        
    }

    override func layoutSubviews() {
        
        /// Placeholder demo lines ... uncomment to test
//        lines = [CGLine] {
//            
//            for _ in 0...3 {
//                
//                $0.append(CGLine {
//                    
//                    $0.strokeWidth = CGFloat(drand48()) * 20
//                    
//                    for _ in 0...10 {
//                        
//                        $0.points.append(CGPoint {
//                        
//                            $0.x = CGFloat(drand48()) * UIScreen.mainScreen().bounds.width
//                            $0.y = CGFloat(drand48()) * UIScreen.mainScreen().bounds.height
//                            
//                        })
//                        
//                    }
//                    
//                    print($0.points)
//                    
//                })
//                
//            }
//            
//        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        lines = [CGLine] {
            
            for _ in 0...3 {
                
                $0.append(CGLine {
                    
                    $0.strokeWidth = CGFloat(drand48()) * 20
                    
                    for _ in 0...10 {
                        
                        $0.points.append(CGPoint {
                            
                            $0.x = CGFloat(drand48()) * UIScreen.main.bounds.width
                            $0.y = CGFloat(drand48()) * UIScreen.main.bounds.height
                            
                            })
                        
                    }
                    
                })
                
            }
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        lines.append(CGLine {
            
            $0.stroke = UIColor.darkGray.cgColor
            $0.fill = UIColor.clear.cgColor
            $0.strokeWidth = 1
            $0.points.append(touch.location(in: self))
            
        })
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first, lines.count > 0 else { return }
        
        lines[lines.count - 1].points.append(touch.location(in: self))
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first, lines.count > 0 else { return }
        
        lines[lines.count - 1].points.append(touch.location(in: self))
        
    }

}

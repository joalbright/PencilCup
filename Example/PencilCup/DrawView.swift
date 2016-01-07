//
//  DrawView.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PencilCup

class DrawView: Canvas {

    override func layoutSubviews() {
        
        /// Placeholder demo lines ... comment out to start with blank canvas.
        lines = [CGLine] {
            
            for _ in 0...3 {
                
                $0.append(CGLine {
                    
                    $0.strokeWidth = CGFloat(drand48()) * 20
                    
                    for _ in 0...10 {
                        
                        $0.points.append(CGPoint {
                        
                            $0.x = CGFloat(drand48()) * UIScreen.mainScreen().bounds.width
                            $0.y = CGFloat(drand48()) * UIScreen.mainScreen().bounds.height
                            
                        })
                        
                    }
                    
                    print($0.points)
                    
                })
                
            }
            
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        lines = [CGLine] {
            
            for _ in 0...3 {
                
                $0.append(CGLine {
                    
                    $0.strokeWidth = CGFloat(drand48()) * 20
                    
                    for _ in 0...10 {
                        
                        $0.points.append(CGPoint {
                            
                            $0.x = CGFloat(drand48()) * UIScreen.mainScreen().bounds.width
                            $0.y = CGFloat(drand48()) * UIScreen.mainScreen().bounds.height
                            
                            })
                        
                    }
                    
                })
                
            }
            
        }
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        
        lines.append(CGLine {
            
            $0.stroke = UIColor.cyanColor()
            $0.fill = UIColor.magentaColor()
            $0.strokeWidth = 10
            $0.points.append(touch.locationInView(self))
            
        })
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first where lines.count > 0 else { return }
        
        lines[lines.count - 1].points.append(touch.locationInView(self))
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first where lines.count > 0 else { return }
        
        lines[lines.count - 1].points.append(touch.locationInView(self))
        
    }

}
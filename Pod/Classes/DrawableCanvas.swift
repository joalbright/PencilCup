//
//  DrawableCanvas.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//


public class Canvas: UIView {
    
    public var lines: [CGLine] = [] { didSet { setNeedsDisplay() } }
    
    public override func drawRect(rect: CGRect) { drawLines(lines) }
    
}
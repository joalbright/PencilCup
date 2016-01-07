//
//  DrawableInkWell.swift
//  PencilCup
//
//  Created by Jo Albright on 1/6/16.
//  Copyright © 2016 Jo Albright. All rights reserved.
//

@IBDesignable class ColorBar: UIControl {

    @IBInspectable var steps: CGFloat = 360
    @IBInspectable var reverse: Bool = false
    
    enum BarType: String { case Hue, Saturation, Brightness, Alpha }
    var type: BarType = .Hue
    @IBInspectable var typeString: String = "Hue" { didSet { type = BarType(rawValue: typeString) ?? .Hue } }
    
    @IBInspectable var isHorizontal: Bool = false
    
    @IBInspectable var handleColor: UIColor = UIColor.blackColor()
    
    @IBInspectable var h: CGFloat = 0 { didSet { setNeedsDisplay() } }
    @IBInspectable var s: CGFloat = 1 { didSet { setNeedsDisplay() } }
    @IBInspectable var b: CGFloat = 1 { didSet { setNeedsDisplay() } }
    @IBInspectable var a: CGFloat = 1 { didSet { setNeedsDisplay() } }
    
    @IBInspectable var value: CGFloat = 0 { didSet { setNeedsDisplay() } }
    @IBInspectable var minValue: CGFloat = 0
    @IBInspectable var maxValue: CGFloat = 100
    
    var locked: Bool = true
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first else { return }
        let location = touch.locationInView(self)
        
        let wh = frame.width < frame.height ? frame.width : frame.height
        
        let percent = 1 - (value - minValue) / (maxValue - minValue)
        
        let x = isHorizontal ? frame.height / 2 + ((frame.width - frame.height) * percent) : frame.width / 2
        let y = isHorizontal ? frame.height / 2 : frame.width / 2 + ((frame.height - frame.width) * percent)
        
        locked = !(fabs(location.x - x) < wh / 2 && fabs(location.y - y) < wh / 2)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first where !locked else { return }
        let location = touch.locationInView(self)
        
        let percent = isHorizontal ? (location.x - frame.height / 2) / (frame.width - frame.height) : (location.y - frame.width / 2) / (frame.height - frame.width)
        
        let rP = reverse ? 1 - percent : percent
        
        value = rP * (maxValue - minValue) + minValue
        
        if value < minValue { value = minValue }
        if value > maxValue { value = maxValue }
        
        switch type {
            
        case .Hue: h = (value - minValue) / (maxValue - minValue)
        case .Saturation: s = (value - minValue) / (maxValue - minValue)
        case .Brightness: b = (value - minValue) / (maxValue - minValue)
        case .Alpha : a = (value - minValue) / (maxValue - minValue)
            
        }
        
        sendActionsForControlEvents(.ValueChanged)
        
    }
    
    override func drawRect(rect: CGRect) {
        
        steps = steps == 0 ? isHorizontal ? rect.width : rect.height : steps
        
        layer.cornerRadius = rect.width < rect.height ? rect.width / 2 : rect.height / 2
        layer.masksToBounds = true
        
        let sD: CGFloat = isHorizontal ? rect.width != steps ? 2 : 0 : rect.height != steps ? 2 : 0
        
        let context = UIGraphicsGetCurrentContext()
        
        var rW = reverse ? isHorizontal ? rect.width : 0 : 0
        var rH = reverse ? isHorizontal ? 0 : rect.height : 0
        let r: CGFloat = reverse ? 1 : -1
        
        let xM = isHorizontal ? rect.width / steps : 0
        let yM = isHorizontal ? 0 : rect.height / steps
        
        let width = isHorizontal ? rect.width / steps + sD : rect.width
        let height = isHorizontal ? rect.height : rect.height / steps + sD
        
        for i in 0...Int(steps) {
            
            switch type {
                
            case .Hue : UIColor(hue: CGFloat(i) / steps, saturation: 1, brightness: 1, alpha: 1).set()
            case .Saturation : UIColor(hue: h, saturation: CGFloat(i) / steps, brightness: b, alpha: 1).set()
            case .Brightness : UIColor(hue: h, saturation: s, brightness: CGFloat(i) / steps, alpha: 1).set()
            case .Alpha : UIColor(hue: h, saturation: s, brightness: b, alpha: CGFloat(i) / steps).set()
                
            }
            
            context?.rect(CGRect(rW - (CGFloat(i) * xM * r), rH - (CGFloat(i) * yM * r), width, height))?.fill()
            
        }
        
        context?.blend(.Clear)?.line(6.5)
        
        rW = rW > 0 ? rW - rect.height : 0
        rH = rH > 0 ? rH - rect.width : 0
        
        let percent = (value - minValue) / (maxValue - minValue)
        let x = isHorizontal ? rW - (rect.width - rect.height) * percent * r : 0
        let y = isHorizontal ? 0 : rH - (rect.height - rect.width) * percent * r
        
        let handleWH = rect.width < rect.height ? rect.width : rect.height
        let handleRect = CGRect(x, y, handleWH, handleWH).inset(3)
        
        context?.ellipse(handleRect)?.stroke()?.blend(.Normal)?.color(handleColor)?.line(1)
        
        if percent == 0 && type == .Alpha {
            
            let (l1,l2) = (handleRect.pointOnCircleInRect(-45),handleRect.pointOnCircleInRect(-225))
            
            context?.line(2)?.color(UIColor.redColor()) ->- l1 -+- l2
            
        }
        
        context?.ellipse(CGRect(x, y, handleWH, handleWH).inset(3))?.stroke()
        
    }
    
}

@IBDesignable class ColorWheel: UIControl {
    
    @IBInspectable var steps: CGFloat = 360
    
    @IBInspectable var hueStart: CGFloat = 0
    @IBInspectable var hueEnd: CGFloat = 360
    
    @IBInspectable var saturation: CGFloat = 1
    @IBInspectable var brightness: CGFloat = 1
    
    override func drawRect(rect: CGRect) {
        
        layer.cornerRadius = rect.width > rect.height ? rect.width / 2 : rect.width / 2
        layer.masksToBounds = true
        
        let context = UIGraphicsGetCurrentContext()
        
        let degrees: CGFloat = 360
        
        for d in 0...Int(steps) {
            
            let hueRange = hueEnd - hueStart
            let distance = degrees / steps
            let degree = CGFloat(d) * distance
            let percent = CGFloat(d) / steps
            
            var hue = percent * (hueRange / degrees) + hueStart / degrees
            
            if hue < 0 { hue += 1 } else if hue > 1 { hue -= 1 }
            
            UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1).set()
            
            let a1 = rect.inset(-100).pointOnCircleInRect(degree - distance / 2 - 0.25)
            let a2 = rect.inset(-100).pointOnCircleInRect(degree + distance / 2 + 0.25)
            
            context ->- rect.center -+- a1 -+- a2 -■ nil
            
        }
        
    }
    
    // TODO: Add value functionality
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        sendActionsForControlEvents(.ValueChanged)
        
    }
    
}


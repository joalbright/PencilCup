//
//  ColorViewController.swift
//  PencilCup
//
//  Created by Jo Albright on 1/8/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var wheel: ColorWheel!
    
    @IBOutlet weak var hueBar: ColorBar!
    
    @IBOutlet weak var saturationBar: ColorBar!
    
    @IBOutlet weak var brightnessBar: ColorBar!
    
    @IBOutlet weak var alphaBar: ColorBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func hueChanged(bar: ColorBar) {
        
        print(bar.value)
        
        saturationBar.h = bar.value / 360
        brightnessBar.h = bar.value / 360
        alphaBar.h = bar.value / 360
        
    }
    
    @IBAction func brightnessChanged(bar: ColorBar) {
        
        saturationBar.b = bar.value
        alphaBar.b = bar.value
        
        
    }
    
    @IBAction func saturationChanged(bar: ColorBar) {
        
        brightnessBar.s = bar.value
        alphaBar.s = bar.value
        
    }
}

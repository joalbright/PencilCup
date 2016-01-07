//
//  Inlinit.swift
//  Inlinit
//
//  Created by Jo Albright on 01/06/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

import UIKit

public protocol Inlinit { init() }

public extension Inlinit {
    
    init(@noescape b: inout Self -> Void) { self.init(); b(&self) }
    
}

// MARK: Extensions

extension UIView: Inlinit { }
extension Array: Inlinit { }
extension Dictionary: Inlinit { }
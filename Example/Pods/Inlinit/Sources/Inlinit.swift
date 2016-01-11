//
//  Inlinit.swift
//  Inlinit
//
//  Created by Jo Albright on 01/06/2016.
//  Copyright (c) 2016 Jo Albright. All rights reserved.
//

public protocol Inlinit { init() }

public extension Inlinit {
    
    init(@noescape b: inout Self -> Void) { self.init(); b(&self) }
    
}

infix operator <- { }

public func <- <T:Inlinit>(inout lhs: T, rhs: inout T -> ()) {
    
    rhs(&lhs)
    
}

// MARK: Extensions

extension Array: Inlinit { }
extension Dictionary: Inlinit { }
extension Set: Inlinit { }

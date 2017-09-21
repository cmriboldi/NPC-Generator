//
//  NSObject+EnumIterator.swift
//  NPCGenerator
//
//  Created by Christian Riboldi on 9/14/17.
//  Copyright © 2017 Christian Riboldi. All rights reserved.
//

import Foundation

extension NSObject {
    
    func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) {
                $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee }
            }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }

}

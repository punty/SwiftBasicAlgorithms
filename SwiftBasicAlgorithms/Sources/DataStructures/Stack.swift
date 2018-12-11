//
//  Stack.swift
//  SwiftBasicAlgorithms
//
//  Created by Francesco Puntillo on 11/12/2018.
//  Copyright © 2018 FP. All rights reserved.
//

import Foundation

struct Stack<T> {
    private var storage = [T]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    var top: T? {
        return storage.last
    }
    mutating func push(_ element: T) {
        storage.append(element)
    }
    mutating func pop() -> T? {
        return storage.popLast()
    }
}

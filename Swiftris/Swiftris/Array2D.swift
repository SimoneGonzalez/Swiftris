//
//  Array2D.swift
//  Swiftris
//
//  Created by Simone Gonzalez on 6/23/17.
//  Copyright © 2017 Simone Gonzalez. All rights reserved.
//

import Foundation

class Array2D<T> {
    let columns: Int
    let rows: Int
    
    var array: Array<T?>
    
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        
        self.rows = rows
        
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
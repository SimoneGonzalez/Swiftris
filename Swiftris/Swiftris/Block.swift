//
//  Block.swift
//  Swiftris
//
//  Created by Simone Gonzalez on 6/27/17.
//  Copyright © 2017 Simone Gonzalez. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, CustomStringConvertible {
    
    case Blue = 0, Orange, Red, Teal, Purple, Yellow
    
    var spriteName: String {
        
        switch self {
        case .Blue:
            return "Blue"
            
        case .Orange:
            return "Orange"
            
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    var description: String {
        return self.spriteName
    }
    
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, CustomStringConvertible {
    
    //Constants
    let color: BlockColor
    
    //Properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    var spriteName: String {
        return color.spriteName
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column:Int, row:Int, color: BlockColor) {
        
        self.column = column
        self.row = row
        self.color = color
    }
}

func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}














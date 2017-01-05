//
//  Board.swift
//  TicTacToeUI
//
//  Created by Adrian McDaniel on 1/4/17.
//  Copyright © 2017 dssafsfsd. All rights reserved.
//

import Foundation


public struct Board : Equatable, CustomStringConvertible {
    
    public static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.slots == rhs.slots && lhs.lastPlayed == rhs.lastPlayed
    }
    
    
    
    public var slots: [Marker]
    public var lastPlayed: Marker
    
    public init(slots: [Marker], lastPlayed: Marker) {
        self.slots = slots
        self.lastPlayed = lastPlayed
    }
    
    
    public enum Marker : CustomStringConvertible {
        case x
        case o
        case empty
        
        public var description: String {
            switch self {
            case .x:
                return "x"
            case .o:
                return "o"
            case .empty:
                return " "
            }
        }
    }
    
    public subscript(row: Int, column: Int) -> Marker {
        get{
            if row < 0 || row > 2 {
                fatalError("Not a spot on the board")
            }
            return slots[(row * 3) + column]
        }
        set {
            slots[(row * 3) + column] = newValue
        }
        
    }
    
    public var description: String {
        let horizontalLine = "-----"
        let lineOne = "\(slots[0])|\(slots[1])|\(slots[2])"
        let lineTwo = "\(slots[3])|\(slots[4])|\(slots[5])"
        let lineThree = "\(slots[6])|\(slots[7])|\(slots[8])"
        return "\(lineOne)\n\(horizontalLine)\n\(lineTwo)\n\(horizontalLine)\n\(lineThree)"
    }
    
    
    
    public mutating func takeSlot(row: Int, column: Int, marker: Marker) ->  Bool {
        guard row < 3 && column < 3 else {
            return false }
        if marker == self.lastPlayed || self[row, column] != .empty {
            return false
        } else {
            self[row, column] = marker
            self.lastPlayed = marker
            return true
        }
    }
    
    
    
    public func boardFull() -> Bool {
        if self[0, 0] != .empty && self[0, 1] != .empty && self[0, 2] != .empty  && self[1, 0] != .empty && self[1, 1] != .empty && self[1, 2] != .empty && self[2, 0] != .empty && self[2, 1] != .empty && self[2, 2] != .empty {
            return true
        } else {
            return false
        }
    }
    
    
    
    public func isThereAWinner() -> Bool {
        if self[0, 0] == .x && self[0, 1] == .x && self[0, 2] == .x {
            print("PlayerX wins!")
            return true
        } else if self[1, 0] == .x && self[1, 1] == .x && self[1, 2] == .x {
            print("PlayerX wins!")
            return true
        } else if self[2, 0] == .x && self[2, 1] == .x && self[2, 2] == .x {
            print("PlayerX wins!")
            return true
        } else if self[0, 0] == .x && self[1, 1] == .x && self[2, 2] == .x {
            print("PlayerX wins!")
            return true
        } else if self[0, 2] == .x && self[1, 1] == .x && self[2, 0] == .x {
            print("PlayerX wins!")
            return true
        } else if self[0, 0] == .x && self[1, 0] == .x && self[2, 0] == .x {
            print("PlayerX wins!")
            return true
            
        } else if self[0, 1] == .x && self[1, 1] == .x && self[2, 1] == .x {
            print("PlayerX wins!")
            return true
            
        } else if self[0, 2] == .x && self[1, 2] == .x && self[2, 2] == .x {
            print("PlayerX wins!")
            return true
            
        } else if self[0, 0] == .o && self[0, 1] == .o && self[0, 2] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[1, 0] == .o && self[1, 1] == .o && self[1, 2] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[2, 0] == .o && self[2, 1] == .o && self[2, 2] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[0, 0] == .o && self[1, 1] == .o && self[2, 2] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[0, 2] == .o && self[1, 1] == .o && self[2, 0] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[0, 0] == .o && self[1, 0] == .o && self[2, 0] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[0, 1] == .o && self[1, 1] == .o && self[2, 1] == .o {
            print("PlayerO wins!")
            return true
            
        } else if self[0, 2] == .o && self[1, 2] == .o && self[2, 2] == .o {
            print("PlayerO wins!")
            return true
        } else {
            return false
        }
        
    }
    
    
}

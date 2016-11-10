//
//  Item.swift
//  EnterpriseBusinessRules
//
//  Created by Juan Pablo Lugo on 11/9/16.
//  Copyright © 2016 Nearshore Technology. All rights reserved.
//

public struct Item: CustomStringConvertible {
    var name: String
    var price: Double = 0.00
    var details: String?
    var photo: String?
    
    var type: ItemType
    
    public var description: String {
        return "Item [name:\(name),type:\(type),price:\(price),details:\(details),photo:\(photo)]"
    }
    
    init(n: String, t:ItemType) {
        self.name = n
        self.type = t
    }
    
    public func calculateStockLevel() -> StockLevel {
        
        //get the quantity associated
        //let type = ItemType.Piece(quantity: 10)
        if case .Piece(let quantiy) = self.type {
            print("--------> I'm piece: ",quantiy)
        } else if case .Weight(let grams) = self.type {
            print("--------> I'm weight \(grams)")
        }
        
        switch self.type {
        case let .Piece(quantity) where quantity >= 10:
            return .Green
        case let .Piece(quantity) where quantity >= 5:
            return .Yellow
        case let .Piece(quantity) where quantity < 5:
            return .Red
        case let .Weight(grams) where grams >= 500:
            return .Green
        case let .Weight(grams) where grams >= 200:
            return .Yellow
        case let .Weight(grams) where grams < 200:
            return .Red
        default:
            return .Unknown
        }
        
        /*
        switch self.type {
        case .Piece:
            if self.quantity >= 10 {
                return StockLevel.Green
            } else if self.quantity >= 5 {
                return StockLevel.Yellow
            } else {
                return StockLevel.Red
            }
        case .Weight:
            if self.quantity >= 500 {
                return StockLevel.Green
            } else if self.quantity >= 200 {
                return StockLevel.Yellow
            } else {
                return StockLevel.Red
            }
        }
 */
    }

}
    
public enum StockLevel {
    case Green
    case Yellow
    case Red
    case Unknown
}

public enum ItemType {
    case Piece(quantity: Int)
    case Weight(grams: Int)
}


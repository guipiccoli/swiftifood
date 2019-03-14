//
//  Request.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

enum Transition {
    case Pay, Remove, Submit, Cancel, Deliver, Delete, Started
}

enum State {
    case Paid, OnTheWay, Delivered, Canceled, Cart, Submited
}

class Request: NSObject {
    var status: State
    var transition: Transition
    var items = [String: (number: Int, item: Item)]()
    var totalPrice: Double {
        let _items = self.items.map { (arg) -> Double in
            
            let (_, tuple) = arg
            return tuple.item.price * Double(tuple.number)
        }
        return _items.reduce(0) { $0 + $1 }
    }
    
    override init(){
        self.status = .Cart
        self.transition = .Started
    }
    
    func nextState(){
        
        switch self.status {
        case .Cart:
            if self.transition == .Pay {
                self.status = .Paid
            }
        case .Paid:
            if self.transition == .Submit {
                self.status = .OnTheWay
            }
            else if self.transition == .Cancel {
                self.status = .Canceled
            }
        case .Submited:
            if self.transition == .Deliver {
                self.status = .Delivered
            }
            else if self.transition == .Cancel {
                self.status = .Canceled
            }
            
        default:
            let _ = self.status
        }
    }
    
    func pay() {
        self.transition = .Pay
        nextState()
    }
    
    func cancel() {
        self.transition = .Cancel
        nextState()
    }
    
     func submit() {
        self.transition = .Submit
        nextState()
    }
    
     func deliver() {
        self.transition = .Deliver
        nextState()
    }
    
    func addItem(item: Item) -> Bool {
        if self.status == .Cart {
            let itemReference = item.restaurant.name + item.name
            if self.items.keys.contains(itemReference) {
                self.items[itemReference]?.number += 1
            }
            else {
               self.items[itemReference] = (1, item)
            }
            return true
        }
        else {
            return false
        }
    }
    
    func removeItem(item: Item) {
        self.items.removeValue(forKey: item.restaurant.name + item.name)
    }
    
    func description() -> String {
        var result: String
        result = "State: \(self.status)\n"
        self.items.forEach { (arg) in
        
            let (_, tuple) = arg
            result += "\(tuple.number)x \(tuple.item.name)\n"
            
        }
        
        result += "Price R$\(self.totalPrice)"
        
        return result
    }
    
}

//
//  Request.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct Request {
    var items: [Item]
    var totalPrice: Double {
        let _items = self.items.map { (item) -> Double in
            item.price
        }
        return _items.reduce(0) { $0 + $1 }
    }
    var status: String
    var transition: String
    
    mutating func nextState(){
    
        switch self.status {
        case "Cart":
            if self.transition == "Pay" {
                self.status = "Paid"
            }
            else if self.transition == "Remove" {
                self.status = "Deleted"
            }
        case "Paid":
            if self.transition == "Submit" {
                self.status = "On the way"
            }
            else if self.transition == "Cancel" {
                self.status = "Canceled"
            }
        case "Submited":
            if self.transition == "Deliver" {
                self.status = "Delivered"
            }
            else if self.transition == "Cancel" {
                self.status = "Canceled"
            }
            
        default:
            let _ = self.status
        }
    }
    
    mutating func pay() {
        self.transition = "Pay"
        nextState()
    }
    
    mutating func cancel() {
        self.transition = "Cancel"
        nextState()
    }
    
    mutating func submit() {
        self.transition = "Submit"
        nextState()
    }
    
    mutating func deliver() {
        self.transition = "Deliver"
        nextState()
    }
    
    mutating func delete() {
        self.transition = "Delete"
        nextState()
    }
    
}

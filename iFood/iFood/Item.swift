//
//  Item.swift
//  iFood
//
//  Created by Guilherme Piccoli on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct Item  {
    var name: String
    var restaurant: Restaurant
    var description: String
    var price : Double
    var type: String
    
    func toString() -> String {
        return "\(self.name)\nDescription: \(description)\nPrice: R$\(self.price)\n\(self.type)"
    }
}

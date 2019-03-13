//
//  User.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation


class User: Codable {
    
    var name: String
    var pedidos: Int
    
    init(name: String, pedidos: Int){
        self.name = name
        self.pedidos = pedidos
    }
    
}

//
//  Restaurante.swift
//  iFood
//
//  Created by Guilherme Piccoli on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation


enum DeliveredLocation {
    case Partenon, BelaVista, JardimBotanico, Centro, CidadeBaixa, VilaLeopoldina, Azenha, Petropolis, BomFim
}

enum Category {
    case Healthy, FastFood, HomeMade
}

class Restaurant: Hashable {
   
    var id: Int
    var name: String
    var items = [String: Item]()
    var deliveredLocations : Set<DeliveredLocation>
    var categories: Set<Category>
    var hashValue: Int {
        return id.hashValue
    }
    
    init(id: Int, name: String, deliveredLocations: Set<DeliveredLocation>, categories: Set<Category>) {
        self.id = id
        self.name = name
        self.deliveredLocations = deliveredLocations
        self.categories = categories
    }
    
    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.id == rhs.id
    }
    
    func addItems(item: Item) -> Bool{
        if items.keys.contains(item.name){
            return false
        }
        else {
            items[item.name] = item
            return true
        }
    }
    
    func removeItem(item:Item) -> Bool {
        if items.keys.contains(item.name) {
            items.removeValue(forKey: item.name)
        }
        return false
    }
    
    func listItems() -> [Item] {
        return Array(self.items.values)
    }
    
}

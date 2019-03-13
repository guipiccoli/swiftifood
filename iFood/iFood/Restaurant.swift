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

class Restaurant {
    var name : String
    var items : Array<Item>
    var deliveredLocations : DeliveredLocation
    
    init(name: String, deliveredLocations: DeliveredLocation){
        self.name = name
        self.deliveredLocations = deliveredLocations
        self.items = []
    }
    
    func addItems(item: Item) -> Bool{
        if items.contains(item){
            return false
        }
        else {
            items.append(item)
            return true
        }
    }
    
    func removeItem(item:Item) -> Bool{
        if items.contains(item){
            for (i, auxItem) in self.items.enumerated(){
                if auxItem == item {
                    items.remove(at: i)
                    return true
                }
            }
        }
        return false
    }
}

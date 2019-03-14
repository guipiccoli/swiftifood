//
//  main.swift
//  iFood
//
//  Created by Guilherme Piccoli on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

var ifood = Ifood.init()
var user = User.init(name: "Paulinho", request: [])


var gelson = ifood.registerRestaurant(name: "Xis do Gelson", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.JardimBotanico], categories: [Category.FastFood, Category.HomeMade])
var madero = ifood.registerRestaurant(name: "Madero Burguer", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.Centro, DeliveredLocation.Partenon, DeliveredLocation.CidadeBaixa], categories: [Category.FastFood])
var cookieFoca = ifood.registerRestaurant(name: "Cookie do Foca", deliverLocations: [DeliveredLocation.Petropolis, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.CidadeBaixa], categories: [Category.HomeMade])
var saudeNoCopo = ifood.registerRestaurant(name: "Saude no Copo", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.JardimBotanico, DeliveredLocation.CidadeBaixa, DeliveredLocation.Centro], categories: [Category.Healthy])

let xstrogo = ifood.createItem(restaurant: gelson!, name: "Xis Strogonoff", description: "Pao, ervilha, queijo, milho, maionese, strogonoff, ovo", price: 60.0, type: "Lanche")
let xcarne = ifood.createItem(restaurant: gelson!, name: "Xis Carne", description: "Pao, ervilha, queijo, milho, maionese, bife de gado, ovo", price: 55.0, type: "Lanche")

//print(gelson!.name, "\n")
//gelson!.listItems().forEach { (item) in
//    print(item.toString(), "\n")
//}
//
//ifood.restaurants.enumerated().forEach({ (i, rest) in
//    print(i, "-", rest.name)
//})

var _ = ifood.moveToCart(user: user, item: xstrogo!)
var _ = ifood.moveToCart(user: user, item: xcarne!)
var _ = ifood.moveToCart(user: user, item: xcarne!)

print(user.mainRequest.description())


//print(ifood.finishOrder(user: user))
//while(true){
//    print(user.mainRequest.description())
//}





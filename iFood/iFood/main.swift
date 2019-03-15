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

//Restaurants Inserts
var gelson = ifood.registerRestaurant(name: "Xis do Gelson", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.JardimBotanico], categories: [Category.FastFood, Category.HomeMade])
var madero = ifood.registerRestaurant(name: "Madero Burguer", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.Centro, DeliveredLocation.Partenon, DeliveredLocation.CidadeBaixa], categories: [Category.FastFood])
var cookieFoca = ifood.registerRestaurant(name: "Cookie do Foca", deliverLocations: [DeliveredLocation.Petropolis, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.CidadeBaixa], categories: [Category.HomeMade])
var saudeNoCopo = ifood.registerRestaurant(name: "Saude no Copo", deliverLocations: [DeliveredLocation.Azenha, DeliveredLocation.BelaVista, DeliveredLocation.Partenon, DeliveredLocation.JardimBotanico, DeliveredLocation.CidadeBaixa, DeliveredLocation.Centro], categories: [Category.Healthy])


//Item inserts
let xstrogo = ifood.createItem(restaurant: gelson!, name: "Xis Strogonoff", description: "Pao, ervilha, queijo, milho, maionese, strogonoff, ovo", price: 60.0, type: "Lanche")
let xcarne = ifood.createItem(restaurant: gelson!, name: "Xis Carne", description: "Pao, ervilha, queijo, milho, maionese, bife de gado, ovo", price: 55.0, type: "Lanche")
let xbrocolis = ifood.createItem(restaurant: gelson!, name: "Xis Brocolis", description: "Pao, ervilha, queijo, milho, maionese, brocolis, ovo", price: 45.0, type: "Lanche")
let xsalada = ifood.createItem(restaurant: gelson!, name: "Xis Salada", description: "Pao, alface, tomate, ervilha, queijo, milho, maionese, bife de gado, ovo", price: 55.0, type: "Lanche")
let xtopgelson = ifood.createItem(restaurant: gelson!, name: "Xis Top Gelson", description: "File Mignon, bacon, azeitona, palmito, milho, ervilha, cebola, tomate, alface, salsa, maionese, mostarda, catchup, ovo e queijo.", price: 63.0, type: "Lanche")

let maderoSimples = ifood.createItem(restaurant: madero!, name: "Madero", description: "Pao, carne (180g), queijo, alface, tomate, cebola roxa, maionese", price: 32.0, type: "Hamburguer")
let maderoDuplo = ifood.createItem(restaurant: madero!, name: "Madero Duplo", description: "Pao, duas carne (180g), queijo, alface, tomate, cebola roxa, maionese", price: 40.0, type: "Hamburguer")
let maderoBacon = ifood.createItem(restaurant: madero!, name: "Madero Bacon", description: "Pao, carne (180g), bacon, queijo, alface, tomate, cebola roxa, maionese", price: 36.0, type: "Hamburguer")
let maderoSuper = ifood.createItem(restaurant: madero!, name: "Madero Super", description: "Pao, duas carne (180g), dez fatias de bacon, queijo, alface, tomate, cebola roxa, maionese", price: 32.0, type: "Hamburguer")
let maderoSimplesCordeiro = ifood.createItem(restaurant: madero!, name: "Madero Cordeiro", description: "Pao, carne de cordeiro(180g), queijo, alface, tomate, cebola roxa, maionese", price: 38.0, type: "Hamburguer")
let maderoDuploCordeiro = ifood.createItem(restaurant: madero!, name: "Madero Duplo Cordeiro", description: "Pao, duas carne de cordeiro (180g), queijo, alface, tomate, cebola roxa, maionese", price: 40.0, type: "Hamburguer")
let maderoBaconCordeiro = ifood.createItem(restaurant: madero!, name: "Madero Bacon Cordeiro", description: "Pao, carne de cordeiro (180g), bacon, queijo, alface, tomate, cebola roxa, maionese", price: 42.0, type: "Hamburguer")
let maderoSuperCordeiro = ifood.createItem(restaurant: madero!, name: "Madero Super Cordeiro", description: "Pao, duas carne de cordeiro (180g), dez fatias de bacon, queijo, alface, tomate, cebola roxa, maionese", price: 45.0, type: "Hamburguer")

let cookieNutella = ifood.createItem(restaurant: cookieFoca!, name: "Cookie Nutella (Recheado)", description: "Cookie com cobertura de chocolate e recheio de nutella", price: 9.90, type: "Sobremesa")
let cookieDoceDeLeite = ifood.createItem(restaurant: cookieFoca!, name: "Cookie Doce de Leite (Recheado)", description: "Cookie com cobertura de chocolate preto e recheio de doce de leite", price: 9.90, type: "Sobremesa")
let cookieChocolate = ifood.createItem(restaurant: cookieFoca!, name: "Cookie de Chocolate", description: "Cookie com gotas de chocolate", price: 5.90, type: "Sobremesa")
let cookieBrigadeiro = ifood.createItem(restaurant: cookieFoca!, name: "Cookie de Brigadeiro", description: "Cookie com cobertura de brigadeiro", price: 5.90, type: "Sobremesa")
let cookieChocolateBranco = ifood.createItem(restaurant: cookieFoca!, name: "Cookie de Chocolate Branco", description: "Cookie com gotas de chocolate branco", price: 5.90, type: "Sobremesa")

//Falta saude no Copo --- nao sei oq tem



ifood.restaurants.enumerated().forEach({ (i, rest) in
    print(i, "-", rest.name)
})

print("Digite o numero correspondente ao restaurante que deseja acessar:")
let option = readLine() ?? ""
var restOption = ifood.restaurants[Int(option)!]

restOption.listItems().enumerated().forEach { (i, item) in
    print(i, "-", item.toString(), "\n")
}


print("Digite o numero correspondente ao item que deseja adicionar ao carrinho:")
let item = readLine() ?? ""


print("\nO seguinte item foi adicionado ao seu carrinho:")
var itemOption = restOption.listItems()[Int(item)!]
print(itemOption.toString())
var _ = ifood.moveToCart(user: user, item: itemOption)

print("\n\(user.mainRequest.description())")

//print(ifood.finishOrder(user: user))
//while(true){
//    print(user.mainRequest.description())
//}





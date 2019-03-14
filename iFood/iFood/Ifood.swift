//
//  Ifood.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct Ifood {

    var restaurantID: Int
    var restaurants: [Restaurant]
    var restaurantsCluster = [String: Set<Restaurant>]()
    var restaurantsCategoryCluster = [Category: Set<Restaurant>]()
    
    init() {
        self.restaurantID = 0
        self.restaurants = []
    }
    
    mutating func registerRestaurant(name: String, deliverLocations: [DeliveredLocation], categories: [Category]) -> Restaurant? {
        let restaurant = Restaurant(id: self.restaurantID, name: name, deliveredLocations: Set(deliverLocations), categories: Set(categories))
        
        let _name = restaurant.name.lowercased()
        let _arrayOfWords = _name.components(separatedBy: " ")
        
        if _arrayOfWords.isEmpty {return nil}
        
        _arrayOfWords.forEach { (word) in
            guard (self.restaurantsCluster[word]?.insert(restaurant)) != nil else {
                var setVar = Set<Restaurant>()
                setVar.insert(restaurant)
                self.restaurantsCluster[word] = setVar
                return
            }
        }
        
        categories.forEach { (category) in
            guard (self.restaurantsCategoryCluster[category]?.insert(restaurant)) != nil else {
                var _setVar = Set<Restaurant>()
                _setVar.insert(restaurant)
                self.restaurantsCategoryCluster[category] = _setVar
                return
            }
        }
        
        self.restaurants.append(restaurant)
        self.restaurantID += 1
        
        return restaurant
    }
    
    mutating func createItem(restaurant: Restaurant, name: String, description: String, price: Double, type: String) -> Item? {
        let item = Item(name: name, restaurant: restaurant, description: description, price: price, type: type)
        
        if item.name.count == 0 {return nil}
        if item.description.count == 0 {return nil}
        if item.price < 0 {return nil}
        if item.type.count == 0 {return nil}
        
        let _name = name.lowercased()
        let _type = type.lowercased()
        
        let arrayOfNames = _name.components(separatedBy: " ")
        let arrayOfTypes = _type.components(separatedBy: " ")
        
        if arrayOfNames.isEmpty {return nil}
        
        let stringSet = Set(arrayOfNames + arrayOfTypes)
        
        stringSet.forEach { (word) in
            guard (self.restaurantsCluster[word]?.insert(restaurant)) != nil else {
                var setVar = Set<Restaurant>()
                setVar.insert(restaurant)
                self.restaurantsCluster[word] = setVar
                return
            }
        }
        
        return restaurant.addItems(item: item) ? item : nil
        
    }
    
    func genericSearch(key: String) -> Set<Restaurant> {
        let _key = key.lowercased()
        let arrayOfWordsName = _key.components(separatedBy: " ")

        var result = Set<Restaurant>()
        
        arrayOfWordsName.forEach { (word) in
            if let restaurant = self.restaurantsCluster[word] {
                result = result.union(restaurant)
            }
        }
        
        return result
        
    }
    
    func filter(key: Category) -> Set<Restaurant> {
        return self.restaurantsCategoryCluster[key] ?? Set<Restaurant>()
    }
    
    func selectRestaurant(restaurant: Restaurant) -> [Item] {
        return restaurant.listItems()
    }
    
    func moveToCart(user: User, item: Item) -> Bool {
       return user.mainRequest.addItem(item: item)
    }
    
    func listCartItems(user: User) -> String {
        return user.mainRequest.description()
    }
    
    func finishOrder(user: User) -> String {
        user.mainRequest.pay()
        return user.mainRequest.description()
    }

}

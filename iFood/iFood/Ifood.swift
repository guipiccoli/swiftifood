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
    var restaurants = [Int: Restaurant]()
    var restaurantsCluster = [String: Set<Restaurant>]()
    
}

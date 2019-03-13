//
//  Ifood.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation

struct Ifood {

    func login(username: String) -> User? {
        guard let data = UserDefaults.standard.value(forKey: username) as? Data else {return nil}
        let user = try? PropertyListDecoder().decode(User.self, from: data)
        guard let name = user?.name else {return nil}
        guard let pedidos = user?.pedidos else {return nil}
        return User(name: name, pedidos: pedidos)
    }
}

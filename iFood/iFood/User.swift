//
//  User.swift
//  iFood
//
//  Created by Eduardo Renani Ribeiro on 12/03/19.
//  Copyright © 2019 Guilherme Piccoli. All rights reserved.
//

import Foundation


class User {
    
    var name: String
    var requests: [Request]
    var mainRequest: Request
    
    init(name: String, request: [Request]) {
        self.name = name
        self.requests = request
        self.mainRequest = Request.init()
    }
    
}

//
//  LoginDTO.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation

struct LoginDTO: Codable {
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

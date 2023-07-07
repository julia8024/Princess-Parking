//
//  User.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation

struct User: Codable {
    
    var carNo: String
    var email: String
    var password: String
    var phone: String
    
    init() {
        carNo = ""
        email = ""
        password = ""
        phone = ""
    }
    
    // 회원가입 생성자
    init(carNo: String, email: String, password: String, phone: String) {
        self.carNo = carNo
        self.email = email
        self.password = password
        self.phone = phone
    }
}

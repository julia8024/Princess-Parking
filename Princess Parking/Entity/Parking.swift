//
//  Parking.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation

struct Parking: Codable {
    var getIn: String
    var pay: Int
    var parkingLoc: Int
    var parkingStatus: Int
    
    init() {
        getIn = "-"
        pay = 0
        parkingLoc = 0
        parkingStatus = 0
    }
}

//
//  ParkingStatus.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation

struct ParkingList: Codable {
    var no1: Int
    var no2: Int
    var no3: Int
    var no4: Int
    var no5: Int
    var no6: Int
    
    init() {
        no1 = 0
        no2 = 0
        no3 = 0
        no4 = 0
        no5 = 0
        no6 = 0
    }
}

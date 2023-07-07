//
//  Statistics.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/11.
//

import Foundation

struct Statistics: Codable {
    
    var pay: Int
    var numUses: Int
    
    init() {
        pay = 0
        numUses = 0
    }
}

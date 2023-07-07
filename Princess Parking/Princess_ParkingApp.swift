//
//  Princess_ParkingApp.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import SwiftUI

var user: User = User() // 내 정보
var parking: Parking = Parking() // 현재 내 주차정보

let host: String = "http://192.168.99.140:8000"

@main
struct Princess_ParkingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

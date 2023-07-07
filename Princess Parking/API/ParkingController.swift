//
//  ParkingController.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import Foundation
import Alamofire

class ParkingController: ObservableObject {
    
    @Published var myParking = Parking()
    @Published var parkingList = ParkingList()
    
    func getMyParking(carNo: String) {
        
        let url = host + "/mypark?carNo=" + carNo
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of:Parking.self) { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 getMyParking")
                self.myParking = value
                parking = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getMyParking")
            }
        }
        
    }
    
    func getParkingList() {
        
        let url = host + "/parkingState"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        AF.request(request).responseDecodable(of:ParkingList.self) { response in
            switch response.result {
            case .success(let value):
                print("호출 성공 getParkingList")
                self.parkingList = value
                
            case .failure(_):
                print(response.result)
                print("호출 실패 getParkingList")
            }
        }
        
    }
    
    
    
    
}

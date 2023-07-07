//
//  timerRequest.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/12.
//

import Foundation
import Alamofire
import Combine

// [전역 변수 선언 실시]
//var intCount = 1


class TimerRequest: ObservableObject {
    
//    @Published var showAlert: Bool = false
    @Published var gasStatus = Gas()

    @Published var value : Int = 0
    
    init() {
        
        let url = host + "/gas/status"
        
        // URLRequest 객체 생성 (url 전달)
        var request = URLRequest(url: URL(string: url)!)
        // 메소드 지정
        request.httpMethod = "GET"
        // 헤더 정보 설정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
//            self.value += 1
            AF.request(request).responseDecodable(of:Gas.self) { response in
                switch response.result {
                case .success(let value):
                    print("호출 성공 gas")
                    self.gasStatus = value
                    
                case .failure(_):
                    print(response.result)
                    print("호출 실패 gas")
                }
            }
            
        }
    }
    
    
    // [실시간 반복 작업 시작 호출]
//    var timer : Timer?
//    func startTimer(){
//        print("")
//        print("===============================")
//        print("[startTimer : start]")
//        print("===============================")
//        print("")
//        // [타이머 객체 생성 실시]
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
//    }
//    // [실시간 반복 작업 수행 부분]
//    @objc func timerCallback() {
//        print("")
//        print("===============================")
//        print("[timerCallback : run]")
//        print("[intCount : \(intCount)]")
//        print("===============================")
//        print("")
//
//        // [처리할 로직 작성 실시]
//        intCount += 1 // 1씩 카운트 값 증가 실시
//        if intCount > 5 { // 카운트 값이 5인 경우
//            stopTimer() // 타이머 종료 실시
//            showAlert = true
//            print(showAlert)
////            showAlert(tittle: "카운트 알림", content: "타이머 종료", okBtb: "확인", noBtn: "")
////            showAlert(tittle: "warning", content: "가스 이상치 감지", okBtb: "확인", noBtn: "") // 팝업창 호출
//        }
//    }
//
//    // [실시간 반복 작업 정지 호출]
//    func stopTimer(){
//        print("")
//        print("===============================")
//        print("[stopTimer : end]")
//        print("===============================")
//        print("")
//        // [실시간 반복 작업 중지]
//        if timer != nil && timer!.isValid {
//            timer!.invalidate()
//        }
//    }
//
////    func showAlert(tittle:String, content:String, okBtb:String, noBtn:String) {
////            // [UIAlertController 객체 정의 실시]
////            let alert = UIAlertController(title: tittle, message: content, preferredStyle: UIAlertController.Style.alert)
////
////            // [인풋으로 들어온 확인 버튼이 nil 아닌 경우]
////            if(okBtb != "" && okBtb.count>0){
////                let okAction = UIAlertAction(title: okBtb, style: .default) { (action) in
////                    // [확인 버튼 클릭 이벤트 내용 정의 실시]
////                    return
////                }
////                alert.addAction(okAction) // 버튼 클릭 이벤트 객체 연결
////            }
////
////            // [인풋으로 들어온 취소 버튼이 nil 아닌 경우]
////            if(noBtn != "" && noBtn.count>0){
////                let noAction = UIAlertAction(title: noBtn, style: .default) { (action) in
////                    // [취소 버튼 클릭 이벤트 내용 정의 실시]
////                    return
////                }
////                alert.addAction(noAction) // 버튼 클릭 이벤트 객체 연결
////            }
////
////            // [alert 팝업창 활성 실시]
////            present(alert, animated: false, completion: nil)
////        }
}

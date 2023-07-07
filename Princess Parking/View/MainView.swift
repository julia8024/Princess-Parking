//
//  MainView.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//


import SwiftUI

struct MainView: View {
    
    @ObservedObject var userController = UserController()
    @ObservedObject var parkingController = ParkingController()
    @ObservedObject var timerRequest = TimerRequest()
    
    @State private var showAlert: Bool = false
    
    init() {
//        userController.getStatistics(carNo: user.carNo)
        parkingController.getMyParking(carNo: user.carNo)
        parkingController.getParkingList()
    }
    
    var body: some View {
        VStack {
            
            VStack {
                Text("Princess Parking")
                    .font(.system(size: 32))
                    .fontWeight(.black)
                    .foregroundColor(Color("mainPointColor"))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            .padding(.top, 30)
            .padding(.bottom, 10)
            
            VStack (alignment: .leading) {
                if (self.timerRequest.gasStatus.gas == 1) {
                    HStack {
                        Image(systemName: "exclamationmark.triangle.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 20))
                            .foregroundColor(Color(UIColor.systemRed))
                        Text("가스 누출 위험!!")
                            .foregroundColor(Color(UIColor.systemRed))
                        Spacer()
                    }
                    
                } else {
                    HStack {
                        Image(systemName: "drop.circle.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 20))
                            .foregroundColor(Color(UIColor.systemBlue))
                        Text("공기 좋음")
                            .foregroundColor(Color(UIColor.systemBlue))
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30)
            
            
            ScrollView {
                
                // 회원정보 박스
                HStack {
                    VStack {
                        Image(systemName: "car.fill")
                            .environment(\.symbolVariants, .none)
                            .font(.system(size: 70))
                            .foregroundColor(Color("mainPointColor"))
                            .padding(.bottom, 10)
                        Text("차 번호")
                            .font(.system(size: 16))
                        Text("\(user.carNo)")
                            .font(.system(size: 24))
                            .fontWeight(.black)
                            .foregroundColor(Color("mainPointColor"))
                    }
                    .padding(20)
                    
                    VStack (alignment: .leading){
                        
                        VStack {
                            if (parkingController.myParking.parkingLoc == 0) {
                                Text("출차중")
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("mainPointColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("mainPointColor"), lineWidth: 2))
                                
                            } else {
                                Text("주차중")
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 8)
                                    .fontWeight(.bold)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("mainPointColor"))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color("mainPointColor"), lineWidth: 2))
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("입차 시간")
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            Text(parkingController.myParking.getIn)
                                .foregroundColor(Color("grayTextColor"))
                                .font(.system(size: 14))
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("주차 요금")
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            Text("\(parkingController.myParking.pay)")
                                .foregroundColor(Color("grayTextColor"))
                                .font(.system(size: 14))
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                        
                        HStack {
                            Text("주차 현황")
                                .font(.system(size: 14))
                                .padding(.trailing, 10)
                            
                            if (parkingController.myParking.parkingStatus == 6) {
                                Text("만차")
                                    .foregroundColor(Color("redPointColor"))
                                    .font(.system(size: 14))
                            } else {
                                Text("\(parkingController.myParking.parkingStatus) / 6 대")
                                    .foregroundColor(Color("grayTextColor"))
                                    .font(.system(size: 14))
                            }
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                        
                    }
                    .padding(.bottom, 10)
                    
                }
                .frame(maxWidth: .infinity)
                .background(Color("bgColor"))
                .border(Color.black.opacity(0), width: 0)
                .cornerRadius(20)
                .padding(30)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                
                // 주차 박스
                VStack {
                    HStack {
                        // 1
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no1 == 1 && parking.parkingLoc == 1) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("1")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no1 == 1 && parking.parkingLoc != 1) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("1")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("1")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        // 2
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no2 == 1 && parking.parkingLoc == 2) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("2")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no2 == 1 && parking.parkingLoc != 2) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("2")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("2")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        // 3
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no3 == 1 && parking.parkingLoc == 3) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("3")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no3 == 1 && parking.parkingLoc != 3) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("3")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("3")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        // 4
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no4 == 1 && parking.parkingLoc == 4) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("4")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no4 == 1 && parking.parkingLoc != 4) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("4")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("4")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        // 5
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no5 == 1 && parking.parkingLoc == 5) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("5")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no5 == 1 && parking.parkingLoc != 5) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("5")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("5")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        // 6
                        // 주차된 자리 == 내 자리
                        if (parkingController.parkingList.no6 == 1 && parking.parkingLoc == 6) {
                            ZStack {
                                VStack {
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 20)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 16).fill()
                                            .foregroundColor(Color("mainPointColor"))
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color("mainPointColor"), lineWidth: 2)
                                    }
                                )
                                
                                VStack {
                                    Image(systemName: "car.fill")
                                        .environment(\.symbolVariants, .none)
                                        .font(.system(size: 20))
                                        .foregroundColor(.white)
                                        .padding(.bottom, 10)
                                    
                                    Text("6")
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                            }
                        } else if (parkingController.parkingList.no6 == 1 && parking.parkingLoc != 6) {
                            // 주차된 자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("mainPointColor"))
                                    .padding(.bottom, 10)
                                
                                Text("6")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        } else {
                            // 빈자리
                            VStack {
                                Image(systemName: "car.fill")
                                    .environment(\.symbolVariants, .none)
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("bgColor"))
                                    .padding(.bottom, 10)
                                
                                Text("6")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("mainPointColor"))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color("bgColor"))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("mainPointColor"), lineWidth: 2)
                                
                            )
                        }
                        
//                        ParkingRow(parkingController.parkingList.no1, 1)
//                        ParkingRow(parkingController.parkingList.no2, 2)
//                        ParkingRow(parkingController.parkingList.no3, 3)
//                        ParkingRow(parkingController.parkingList.no4, 4)
//                        ParkingRow(parkingController.parkingList.no5, 5)
//                        ParkingRow(parkingController.parkingList.no6, 6)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 10)

                    HStack {
                        VStack {
                            Image(systemName: "arrow.down")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 16))
                                .padding(.bottom, 2)
                            Text("EXIT")
                                .font(.system(size: 14))
                        }
                        
                        Spacer()
                        VStack {
                            Image(systemName: "arrow.up")
                                .environment(\.symbolVariants, .none)
                                .font(.system(size: 16))
                                .padding(.bottom, 2)
                            Text("ENTRANCE")
                                .font(.system(size: 14))
                        }
                    }
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                        
                }
                .frame(maxWidth: .infinity)
                .background(Color("bgColor"))
                .border(Color.black.opacity(0), width: 0)
                .cornerRadius(20)
                .padding(.horizontal, 30)
                .padding(.top, 0).ignoresSafeArea()
                .padding(.bottom, 30)
                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                
//                VStack {
//
//                    Text("이번달 통계")
//                        .font(.system(size: 18))
//                        .foregroundColor(Color("mainPointColor"))
//                        .padding(.top, 20)
//                        .padding(.bottom, 10)
//                        .fontWeight(.black)
//
//                    HStack {
//
//                        // 누적 주차장 이용 횟수
//                        VStack {
//                            Text("주차장 이용 횟수")
//                                .font(.system(size: 14))
//                                .padding(.bottom, 10)
//                                .foregroundColor(Color("grayTextColor"))
//
//                            Text("\(userController.userStatistics.numUses) 회")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                                .padding(.bottom, 10)
//                                .foregroundColor(Color("mainPointColor"))
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(Color("mainPointColor"), lineWidth: 2)
//                        )
//                        Spacer().frame(width: 20)
//
//                        // 누적 요금
//                        VStack {
//                            Text("누적 이용 요금")
//                                .font(.system(size: 14))
//                                .padding(.bottom, 10)
//                                .foregroundColor(Color("grayTextColor"))
//
//                            Text("\(userController.userStatistics.pay) 원")
//                                .font(.system(size: 24))
//                                .fontWeight(.bold)
//                                .padding(.bottom, 10)
//                                .foregroundColor(Color("mainPointColor"))
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(.vertical, 20)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(Color("mainPointColor"), lineWidth: 2)
//                        )
//
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.bottom, 20)
//
//
//
//                }
//                .frame(maxWidth: .infinity)
//                .background(Color("bgColor"))
//                .border(Color.black.opacity(0), width: 0)
//                .cornerRadius(20)
//                .padding(.horizontal, 30)
//                .padding(.bottom, 20)
//                .shadow(color: .gray.opacity(0.4), radius: 5, x: 0, y: 0)
                
                
//                    .alert("WARNING", isPresented: $showAlert, actions: {
//
//                        Button("확인", action: {
//                        })
//                        Button("취소", role: .cancel, action: {})
//                    }, message: {
//                        Text("[경고] 가스 이상치 감지!")
//                    })
                
            } // scrollview
            

        } // vstack
        .background(Color("bgMainColor"))
        .refreshable {
//            self.userController.getStatistics(carNo: user.carNo)
            self.parkingController.getMyParking(carNo: user.carNo)
            self.parkingController.getParkingList()
            showAlert = true
        }
    }
    
    
}


//struct ParkingRow: View {
//
//    var parkingList: ParkingList
//
//    init(_ parkingList: ParkingList) {
//        self.parkingList = parkingList
//
//    }
//
//    var body: some View {
//        VStack {
//            // 주차된 자리 == 내 자리
//            if (parkingList.isParking == 1 && parking.parkingLoc == parkingList.num) {
//                ZStack {
//                    VStack {
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 20)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .padding(.vertical, 20)
//                    .overlay(
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 16).fill()
//                                .foregroundColor(Color("mainPointColor"))
//                            RoundedRectangle(cornerRadius: 16)
//                                .stroke(Color("mainPointColor"), lineWidth: 2)
//                        }
//                    )
//
//                    VStack {
//                        Image(systemName: "car.fill")
//                            .environment(\.symbolVariants, .none)
//                            .font(.system(size: 20))
//                            .foregroundColor(.white)
//                            .padding(.bottom, 10)
//
//                        Text("\(parkingList.num)")
//                            .font(.system(size: 16))
//                            .foregroundColor(.white)
//                    }
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 20)
//                }
//            } else if (parkingList.isParking == 1 && parking.parkingLoc != parkingList.num) {
//                // 주차된 자리
//                VStack {
//                    Image(systemName: "car.fill")
//                        .environment(\.symbolVariants, .none)
//                        .font(.system(size: 20))
//                        .foregroundColor(Color("mainPointColor"))
//                        .padding(.bottom, 10)
//
//                    Text("\(parkingList.num)")
//                        .font(.system(size: 16))
//                        .foregroundColor(Color("mainPointColor"))
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 20)
//                .background(Color("bgColor"))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color("mainPointColor"), lineWidth: 2)
//
//                )
//            } else {
//                // 빈자리
//                VStack {
//                    Image(systemName: "car.fill")
//                        .environment(\.symbolVariants, .none)
//                        .font(.system(size: 20))
//                        .foregroundColor(Color("bgColor"))
//                        .padding(.bottom, 10)
//
//                    Text("\(parkingList.num)")
//                        .font(.system(size: 16))
//                        .foregroundColor(Color("mainPointColor"))
//                }
//                .frame(maxWidth: .infinity)
//                .padding(.vertical, 20)
//                .background(Color("bgColor"))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(Color("mainPointColor"), lineWidth: 2)
//
//                )
//            }
//        }
//
//
//    }
//}

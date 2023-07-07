//
//  StartView.swift
//  Princess Parking
//
//  Created by 장세희 on 2022/12/09.
//

import SwiftUI

struct StartView: View {
    
    // 로그인
    @State private var loginSettings = false
    
    // 회원가입
    @State private var joinSettings = false
    
    @State private var isLogined = true
    @State private var isJoined = false
    
    var body: some View {
        
        NavigationView {
            VStack {
//                Image("camoTitle")
//                    .resizable()
//                    .aspectRatio(1.0, contentMode: .fit)
//                    .clipped()
//                    .padding(.horizontal, 80)
                
                Image("pparkingAppIcon")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipped() //프레임을 벗어나는 이미지 제거
                    .padding(60)
                
                VStack {
                    
                    Button {
                        joinSettings = true
                    } label: {
                        Text("P.P 앱 시작하기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(Color("mainColor"))
                            .frame(maxWidth: .infinity)
                    }
                    .padding(.vertical, 20)
                    .background(.white)
                    .cornerRadius(20)
                    .sheet(isPresented: $joinSettings) {
                        JoinView(
                            isPresented: $joinSettings, isJoined: $loginSettings)
                    }
                    HStack {
                        
                        Text("이미 회원이신가요?")
                            .font(.system(size: 14))
                            .foregroundColor(.white).opacity(0.6)
                        
                        Button {
                            loginSettings = true
                        } label: {
                            Text("로그인")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                        .sheet(isPresented: $loginSettings) {
                            LoginView(
                                isPresented: $loginSettings,
                            isLogined: $isLogined)
                        }
                        
                    }
                    .padding(.top, 30)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                
                NavigationLink(destination: MainView().navigationBarBackButtonHidden(true),
                               isActive: $isLogined, label:{})
                    .navigationBarHidden(true)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("mainColor"))
    
            
        } // navigationView
        
    }  // body
    
    
}

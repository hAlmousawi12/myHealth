//
//  LoginWithPhoneNumber.swift
//  FirebaseTemplate
//
//  Created by Hussain on 7/11/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct LoginWithPhoneNumber: View {
    @StateObject var loginData: FirebaseEnv
    @State var isSmall = UIScreen.main.bounds.height < 750
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack {
                        Text("Continue with Phone")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.theme.onbg)
                            .padding()
                        
                        Image("phone")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                        
                        Text("You'll receive a 4 digit code\n to verify next.")
                            .font(isSmall ? .none : .title2)
                            .foregroundColor(.theme.sec)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        // Mobile Number Field
                        HStack {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Enter your number")
                                    .font(.caption)
                                    .foregroundColor(.theme.sec)
                                
                                Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.theme.onbg)
                            }
                            
                            Spacer(minLength: 0)
                            
                            NavigationLink(destination: VerificationView(loginData: loginData).navigationBarHidden(true), isActive: $loginData.gotoVerify) {
                                
                                Text("")
                                    .hidden()
                            }
                            
                            Button(action: loginData.sendCode, label: {
                                Text("Continue")
                                    .foregroundColor(.theme.onp)
                                    .padding(.vertical, 18)
                                    .padding(.horizontal, 38)
                                    .background(Color.theme.p)
                                    .cornerRadius(15)
                            })
                            .disabled(loginData.phNo == "")
                        }
                        .padding()
                        .background(Color.theme.bg)
                        .cornerRadius(20)
                        .shadow(color: Color.theme.shadow.opacity(0.5), radius: 5, x: 0, y: -5)
                    }
                    .frame(height: UIScreen.main.bounds.height / 1.8)
                    .background(Color.theme.bg)
                    .cornerRadius(20)
                    
                    // Custom Number Pad
                    customNumberPad(value: $loginData.phNo, ifVerify: false)
                }
                .background(Color.theme.bg.ignoresSafeArea())
                
                if loginData.error {
                    AlertView(msg: loginData.errorMsg, show: $loginData.error)
                }
            }.navigationBarHidden(true)
        }
    }
}

var rows = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "delete.left"]

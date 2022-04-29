//
//  VerificationView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/18/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct VerificationView: View {
    @StateObject var loginData: FirebaseEnv
    @Environment(\.presentationMode) var present
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
//                        Button(action: {
//                            present.wrappedValue.dismiss()
//                        }) {
//                            Image(systemName: "arrow.left")
//                                .font(.title2)
//                                .foregroundColor(.theme.onbg)
//                        }
                        
                        Spacer()
                        
                        Text("Verify Phone")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.theme.onbg)
                        
                        Spacer()
                        
                        if loginData.loading {
                            ProgressView()
                        }
                    }
                    .padding()
                    
                    Text("Code sent to \(loginData.phNo)")
                        .foregroundColor(.theme.sec)
                        .padding(.bottom)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 15) {
                        ForEach(0..<6, id: \.self) { index in
                            // displaying code
                            CodeView(code: getCodeAtIndex(index: index))
                        }
                    }
                    .padding()
                    .padding(.horizontal, 20)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 6) {
                        Text("Didn't receive code?")
                            .foregroundColor(.theme.sec)
                        
                        Button(action: loginData.requestCode) {
                            Text("Request Again")
                                .fontWeight(.bold)
                                .foregroundColor(.theme.onbg)
                        }
                    }
                    
                    Button(action: {}) {
                        Text("Get via call")
                            .fontWeight(.bold)
                            .foregroundColor(.theme.onbg)
                    }
                    .padding(.top, 6)
                    
                    Button(action: loginData.verifyCode) {
                        Text("Verify and Create Account")
                            .foregroundColor(.theme.onp)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.theme.p)
                            .cornerRadius(15)
                    }
                    .padding()
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .background(Color.theme.bg)
                .cornerRadius(20)
                
                // Custom Number Pad
                customNumberPad(value: $loginData.code, ifVerify: true)
            }
            .background(Color.theme.bg.ignoresSafeArea())
            
            if loginData.error {
                AlertView(msg: loginData.errorMsg, show: $loginData.error)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    // getting Code at each index
    func getCodeAtIndex(index: Int) -> String {
        if loginData.code.count > index {
            let start = loginData.code.startIndex
            
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
        }
        
        return ""
    }
}

struct CodeView: View {
    var code: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(code)
                .foregroundColor(.theme.onbg)
                .fontWeight(.bold)
                .font(.title2)
            
            // default frame
                .frame(height: 45)
            
            Capsule()
                .fill(Color.theme.sec.opacity(0.5))
                .frame(height: 4)
        }
    }
}

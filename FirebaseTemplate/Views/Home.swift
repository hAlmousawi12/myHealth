//
//  Home.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignOutButton: View{
    @StateObject var env: FirebaseEnv
    var body: some View{
        Button("Signout") {
            env.signOut()
        }
        .foregroundColor(.red)
    }
}

struct Home: View {
    @StateObject var env: FirebaseEnv
    @StateObject var itemsEnvironment = ItemsEnv()
    var body: some View {
        VStack {
            Header(env: env)
            
            HStack {
                Spacer()
                VStack {
                    Text("اهلاً")
                        .font(.largeTitle)
                        .foregroundColor(.theme.secondary)
                    Text(env.user.fullName)
                        .font(.title)
                        .foregroundColor(.theme.secondary)
                }
            }.padding()
            
            
            VStack(spacing: 50) {
                
                NavigationLink(destination: StepsView(env: env), label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 1)
                        
                        
                        VStack(alignment: .trailing) {
                            Text("الخطوات")
                                .font(.title)
                                .foregroundColor(.theme.secondary)
                            HStack {
                                Image(systemName: "figure.walk")
                                    .foregroundColor(.black)
                                Text("خطوة")
                                    .foregroundColor(.theme.secondary)
                                Text("الخطوات")
                                .foregroundColor(.black)
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(5)
                    }
                })
                .frame(width: 300, height: 90)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1)
                    
                    
                    VStack(alignment: .trailing) {
                        Text("جرعة الدواء الخاصة بك:")
                            .font(.title)
                            .foregroundColor(.theme.secondary)
                        HStack {
                            Image(systemName: "pills.fill")
                                .foregroundColor(.black)
                            VStack {
                                Text("6")
                                    .frame(width: 25, height: 25)
                                Text("الباقي")
                            }.foregroundColor(.theme.secondary)
                            VStack {
                                Text("4")
                                    .frame(width: 25, height: 25)
                                Text("انتهاء")
                            }
                            .foregroundColor(.theme.secondary)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(5)
                }
                .frame(width: 300, height: 110)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 1)
                    
                    
                    VStack(alignment: .trailing) {
                        Text("الماء:")
                            .font(.title)
                            .foregroundColor(.theme.secondary)
                        Text("50٪")
                            .font(.title)
                            .foregroundColor(.theme.secondary)
                        HStack {
                            Image(systemName: "cup.and.saucer")
                            Text("1.5ل من 3ل")
                                .font(.title2)
                        }.foregroundColor(.theme.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(5)
                }
                .frame(width: 300, height: 110)
                
            }
            Spacer()
        }
        .onAppear(perform: env.getUser)
        .navigationBarHidden(true)
    }
}

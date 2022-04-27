//
//  AuthenticationView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Image("mini logo")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 75)
            Text("مرحبا بكم!")
                .font(.custom("Jomhuria-Regular", size: 75, relativeTo: .largeTitle))
                .foregroundColor(.black)
            Spacer()
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 275, height: 275)
                .padding()
            //            Spacer()
            VStack(spacing: 20) {
                
                NavigationLink(
                    destination: SignUp(env: env),
                    label: {
                        Text("انشئ حساب")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                )
                .frame(width: 320, height: 60)
                .background(Color.theme.red)
                .cornerRadius(25)
                .shadow(radius: 10)
                
                NavigationLink(
                    destination: SignIn(env: env),
                    label: {
                        Text("تسجيل الدخول")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                )
                .frame(width: 320, height: 60)
                .background(Color.black)
                .cornerRadius(25)
                .shadow(radius: 10)
                
            }
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct SignInModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding()
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity,  alignment: .center)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct ImageWithShadow: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .padding(25)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.theme.bg, lineWidth: 5)
                    .shadow(color: Color.theme.shadow, radius: 5, x: 0, y: 0)
                    .shadow(color: Color.theme.shadow, radius: 4, x: -4, y: -4)
            )
            .cornerRadius(20)
            .padding(5)
    }
}

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
        VStack{
            NavigationLink(
                destination: SignIn(env: env),
                label: {Text("Sign in").modifier(SignInModifier())}
            )
            NavigationLink(
                destination: SignUp(env: env),
                label: {Text("Create an account")}
            )
        }
        .navigationTitle("Home")
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

//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignIn: View {
    @StateObject var vm = SignInViewModel()
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
           signInPage
        }
    }
}



extension SignIn {
    private var email: some View {
        VStack {
            HStack {
                Spacer()
                Text("البريد الالكتروني")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.theme.secondary)
                TextField("اكتب بريدك الالكتروني", text: $vm.userCredentials.email)
                    .keyboardType(.emailAddress)
            }
            .modifier(TextFieldShape())
        }
    }
    
    private var password: some View {
        VStack {
            HStack {
                Spacer()
                Text("كلمة السر")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.theme.secondary)
                SecureField("اكتب كلمة السر", text: $vm.userCredentials.password)
                
            }
            .modifier(TextFieldShape())
        }
    }
    
    private var signInButton: some View {
        Button("تسجيل الدخول"){
            env.signIn(user: vm.userCredentials) { (uid) in
                print("Signed in!")
            } fail: { (error) in
                vm.alertError = error?.localizedDescription ?? ""
                vm.alertShown = true
            }
        }
            .modifier(ButtonShape())
    }
    
    private var goToSignUp: some View {
        NavigationLink("ليس لديك حساب؟ اضغط هنا", destination: SignUp(env: env))
            .foregroundColor(.theme.secondary)
    }
    
    private var forgotPassword: some View {
        NavigationLink(
            destination: ForgotPasswordView(),
            label: {
                Text("نسيت كلمة المرور؟ اضغط هنا")
                    .foregroundColor(.theme.secondary)
            })
    }
    
    
    var signInPage: some View {
        VStack(spacing: 14) {
            Spacer()
            email
            password
            signInButton
            forgotPassword
            Spacer()
            goToSignUp
                .padding(.bottom)
        }
        .alert(isPresented: $vm.alertShown, content: {
            Alert(title: Text("Error!"), message: Text(vm.alertError), dismissButton: .cancel())
        })
        .padding()
    }
}


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
    var body: some View {
        VStack(spacing: 15){
            
            TextField("email", text: $vm.userCredentials.email).keyboardType(.emailAddress)
            SecureField("password", text: $vm.userCredentials.password)
            Button("Sign in"){ vm.signIn() }
            NavigationLink("Don't have an account?", destination: SignIn())
        }
        .alert(isPresented: $vm.alertShown, content: {
            Alert(title: Text("Error!"), message: Text(vm.alertError), dismissButton: .cancel())
        })
        .padding()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
            .environmentObject(FirebaseEnv())
    }
}

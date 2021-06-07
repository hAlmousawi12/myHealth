//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @State var user = User()
    @State var password = ""
    @State var confirmPassword = ""
    @EnvironmentObject var env: FirebaseEnv
    var body: some View {
        Form{
            TextField("Enter your full name", text: $user.fullName)
            TextField("Enter your email", text: $user.email)
                .keyboardType(.emailAddress)
            SecureField("Enter your password", text: $password)
            SecureField("Confirm your password", text: $confirmPassword)
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .environmentObject(FirebaseEnv())
        }
    }
}

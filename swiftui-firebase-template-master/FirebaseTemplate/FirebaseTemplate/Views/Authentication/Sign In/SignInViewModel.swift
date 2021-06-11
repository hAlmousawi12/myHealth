//
//  SignInViewModel.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/6/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    var env = FirebaseEnv()
    @Published var userCredentials = SignInCredentials(email: "", password: "")
    @Published var alertShown: Bool = false
    @Published var alertError: String = ""
    
    func signIn() {
        env.signIn(user: userCredentials) { (uid) in
            print("Signed in!")
        } fail: { (error) in
            self.alertError = error?.localizedDescription ?? ""
            self.alertShown = true
        }
    }
}

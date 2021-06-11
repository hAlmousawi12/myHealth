//
//  SignUpViewModel.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/6/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var user = User()
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var env = FirebaseEnv()
    @Published var isAlertPresented = false
    @Published var alertMessage = ""
    @Published var genders = ["ذكر", "انثى"]
    func signUp() {
        if confirmPassword == password {
            env.signUp(user: user, password: password)
        } else {
            self.isAlertPresented.toggle()
            self.alertMessage = "Confirm your password correctly"
        }
    }
}

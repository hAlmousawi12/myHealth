//
//  SignInViewModel.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/6/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var userCredentials = SignInCredentials(email: "", password: "")
    @Published var alertShown: Bool = false
    @Published var alertError: String = ""
}

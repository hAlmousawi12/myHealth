//
//  SignInView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignUp: View {
    @StateObject var vm = SignUpViewModel()
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            signUpPage
        }
    }
}


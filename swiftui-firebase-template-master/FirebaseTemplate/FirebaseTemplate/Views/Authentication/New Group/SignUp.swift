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
    var body: some View {
        VStack {
            signUpPage
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SignUp()
                .accentColor(.black)
                .environmentObject(FirebaseEnv())
        }
    }
}

//
//  ForgotPasswordView.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/17/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject var vm = ForgotPasswordViewModel()
    var body: some View {
        forgetPasswordPage
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}


//
//  ForgetPasswordExtension.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/17/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

extension ForgotPasswordView {
    
    private var email: some View {
        TextField("اكتب بريدك الالكتروني", text: $vm.email)
            .modifier(TextFieldShape())
    }
    
    private var button: some View {
        Button("اعد تعيين كلمة السر") {
            Networking.forgetPassword(email: vm.email) {
                vm.isAlertPresented.toggle()
                vm.alertTitle = "تفقد بريدك الالكتروني لكي تعيد تعيين كلمة السر"
            } fail: {
                vm.isAlertPresented.toggle()
                vm.alertTitle = "لقد حدث خطاً ما"
                
            }
            
        }
        .modifier(ButtonShape())
    }
    
    var forgetPasswordPage: some View {
        VStack(spacing: 20) {
            email
            
            button
        }.alert(isPresented: $vm.isAlertPresented, content: {
            Alert(title: Text(vm.alertTitle), message: Text(vm.alertMessage), dismissButton: .default(Text("حسنناً!")))
        })
    }
    
}


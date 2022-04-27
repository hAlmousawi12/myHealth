//
//  SignUpExtesion.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/7/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

extension SignUp {
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
                TextField("اكتب بريدك الالكتروني", text: $vm.user.email)
                    .keyboardType(.emailAddress)
            }
            .modifier(TextFieldShape())
        }
    }
    
    private var fullName: some View {
        VStack {
            HStack {
                Spacer()
                Text("الاسم الثلاثي")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.theme.secondary)
                TextField("اكتب اسمك الثلاثي", text: $vm.user.fullName)
            }.modifier(TextFieldShape())
            
        }
    }
    
    private var phoneNumber: some View {
        VStack {
            HStack {
                Spacer()
                Text("رقم الهاتف")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image(systemName: "phone")
                    .foregroundColor(.theme.secondary)
                TextField("اكتب رقم هاتفك النقال", text: $vm.user.phoneNumber)
                    .keyboardType(.numberPad)
            }.modifier(TextFieldShape())
            
        }
    }
    
    private var gender: some View {
        VStack {
            HStack {
                Spacer()
                Text("الجنس")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image("male")
                    .resizable()
                    .scaledToFit()
                    
                Picker("اضغط لاختيار الجنس", selection: $vm.user.gender) {
                    ForEach(vm.genders, id: \.self) {
                        Text($0)
                    }
                }
                .foregroundColor(.theme.secondary)
                .pickerStyle(MenuPickerStyle())
                Spacer()
                
                Text(vm.user.gender)
            }
            .modifier(TextFieldShape())
            
        }
    }
    
//    private var birthdate: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text("تاريخ الميلاد")
//                    .padding(.horizontal, 20)
//            }
//            HStack {
//                Image(systemName: "calendar")
//                    .foregroundColor(.theme.secondary)
//                DatePicker("اختر تاريخ ميلادك", selection: $vm.user.birthDate, in: ...Date(), displayedComponents: .date)
//                    .foregroundColor(.theme.secondary)
//            }.modifier(TextFieldShape())
//
//        }
//    }
    
    private var civilId: some View {
        VStack {
            HStack {
                Spacer()
                Text("الرقم المدني")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image("license copy")
                    .resizable()
                    .scaledToFit()
                TextField("اكتب رقمك المدني", text: $vm.user.civilIdNumber)
            }.modifier(TextFieldShape())
            
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
                SecureField("اكتب كلمة السر", text: $vm.password)
                    
            }
            .modifier(TextFieldShape())
        }
    }
    
    private var confirmPassword: some View {
        VStack {
            HStack {
                Spacer()
                Text("تأكيد كلمة السر")
                    .padding(.horizontal, 20)
            }
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.theme.secondary)
                SecureField("اكد كلمة السر", text: $vm.confirmPassword)
            }
            .modifier(TextFieldShape())
        }
    }
    
    private var info: some View {
        VStack(spacing: 10) {
            email
            fullName
            phoneNumber
            gender
//            birthdate
            civilId
            password
            confirmPassword
        }
    }
    
    private var signUpButton: some View {
        Button("انشئ حساب") {
            if vm.confirmPassword == vm.password {
//                let a = Int(vm.user.civilIdNumber) ?? 0
//                vm.user.birthDate = "\(a[0])"
                env.signUp(user: vm.user, password: vm.password)
            } else {
                vm.isAlertPresented.toggle()
                vm.alertMessage = "Confirm your password correctly"
            }
        }
            .modifier(ButtonShape())
    }
    
    var signUpPage: some View {
        ScrollView {
            info
            signUpButton
                .padding(.top, 25)
        }
        .alert(isPresented: $vm.isAlertPresented, content: {
            Alert(title: Text("Error!"), message: Text(vm.alertMessage), dismissButton: .default(Text("Okay!")))
        })
    }
}


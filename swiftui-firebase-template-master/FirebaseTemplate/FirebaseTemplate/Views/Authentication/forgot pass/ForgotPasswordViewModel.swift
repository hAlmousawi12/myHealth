//
//  ForgotPasswordViewModel.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/17/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var isAlertPresented = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
}

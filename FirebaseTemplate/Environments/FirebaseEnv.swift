//
//  FirebaseEnv.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase

class FirebaseEnv: ObservableObject{
    var uid = Networking.getUserId()
    @Published var signedIn: Bool = (FirebaseAuth.Auth.auth().currentUser != nil)
    @Published var email = ""
    @Published var name = ""
    @Published var isLoading = false
    @Published var phNo = ""
    @Published var code = ""
    @Published var errorMsg = ""
    @Published var error = false
    @Published var CODE = ""
    @Published var gotoVerify = false
    @AppStorage("log_Status") var status = false
    @Published var loading = false
    @Published var user: User = User()
    
    func getUser() {
        if let uid = uid {
            Networking.getSingleDocument("users/\(uid)") { (user) in
                self.user = user
            }
        } else {
            print("something went wrong UID")
        }
        
    }
    
    func getCountryCode() -> String {
        let regionCode = Locale.current.regionCode ?? ""
        
        return countries[regionCode] ?? ""
    }
    
    // sending Code To User
    func sendCode() {        
        let number = "+\(getCountryCode())\(phNo)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (CODE, err) in
            if let error = err {
                self.errorMsg = error.localizedDescription
                withAnimation {
                    self.error.toggle()
                }
                return
            }
            
            self.CODE = CODE ?? ""
            self.gotoVerify = true
        }
    }
    
    func verifyCode() {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        
        loading = true
        
        Auth.auth().signIn(with: credential) { (result, err) in
            self.loading = false
            
            if let error = err {
                self.errorMsg = error.localizedDescription
                
                withAnimation {
                    self.error.toggle()
                }
                return
            }
            
            // else, user logged in successfully
            withAnimation {
                self.status = true
            }
        }
    }
    
    func requestCode() {
        sendCode()
        withAnimation {
            self.errorMsg = "Code Sent Successfully."
            self.error.toggle()
        }
    }
    
    var info: AppDelegate
    
    init(info: AppDelegate) {
        self.info = info
    }
    
    func signIn(user: SignInCredentials, success: @escaping (String) -> Void,  fail: ((Error?) -> Void)?){
        Networking.signIn(user: user, success: { uid in
            self.signedIn = true
            success(uid)
        }, fail: fail)
    }
    
    func signOut(){
        if !self.signedIn {
            try? Auth.auth().signOut()
            withAnimation {
                self.status = false
            }
        } else {
            Networking.signOut()
            withAnimation {
                self.signedIn = false
            }
        }
        
    }
    
    func signUp(user: User, password: String){
        Networking.signUp(user: user, password: password) { (uid) in
            self.signedIn = true
        }
    }
    
    func getRootViewController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .init() }
        
        guard let root = screen.windows.first?.rootViewController else { return .init() }
        
        return root
    }
    
    func signUpWithGoogle() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        self.isLoading = true
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) { [self] user, err in
            
            if let error = err {
                self.isLoading = false
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                self.isLoading = false
                return
            }
            
            let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            
            Auth.auth().signIn(with: credentials) { result, err in
                
                self.isLoading = false
                
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                self.email = (user.email ?? "user.email")
                self.name = (user.displayName ?? "user.displayName")

                if !self.email.isEmpty {
                    print("👱🏻‍♂️ Creating user ...")
                    Networking.createItem(User(fullName: self.name, email: self.email, phoneNumber: ""), inCollection: "users") {
                        print("👱🏻‍♂️ User has been created successfully ...")
                        self.signedIn = true
                    } fail: { err in
                        print("❌❌❌\n\(err?.localizedDescription ?? "")")
                    }

                }

                print(user.displayName ?? "user.displayName")
                print(user.email ?? "user.email")
            }
            
        }
    }
    
    
}

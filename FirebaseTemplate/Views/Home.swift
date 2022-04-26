//
//  Home.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct SignOutButton: View{
    @StateObject var env: FirebaseEnv
    var body: some View{
        Button("Signout") {
            env.signOut()
        }
        .foregroundColor(.red)
    }
}

struct Home: View {
    @StateObject var env: FirebaseEnv
    @StateObject var itemsEnvironment = ItemsEnv()
    var body: some View {
        SignOutButton(env: env)
    }
}

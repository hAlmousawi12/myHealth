//
//  MainView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @StateObject var env: FirebaseEnv
    init(info: AppDelegate) {
        _env = StateObject(wrappedValue: FirebaseEnv(info: info))
    }
    
    var body: some View {
        if env.signedIn || env.status {
            TabBarView(env: env)
                .navigationBarHidden(true)
        }
        else{
            AuthenticationView(env: env)
        }
    }
}

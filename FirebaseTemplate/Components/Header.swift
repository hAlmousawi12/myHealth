//
//  Header.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/27/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct Header: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            HStack {
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .foregroundColor(Color.theme.secondary)
                }
                Spacer()
                SignOutButton(env: env)
            }
            NavigationLink(destination: Search()) {
                Text("اضغط هنا للذهاب الى صفحة البحث")
                    .foregroundColor(.theme.secondary)
                    
            }
            .frame(width: 300, height: 30)
            .padding(5)
            .background(Color.white)
            .clipShape(Capsule())
        }
        .padding(10)
        .background(Color.black.edgesIgnoringSafeArea(.top))
        
    }
}



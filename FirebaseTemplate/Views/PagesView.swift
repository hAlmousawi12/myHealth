//
//  PagesView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/29/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct PagesView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            Spacer()
            Text("ماذا تحتاج؟")
                .font(.largeTitle)
                .foregroundColor(.theme.secondary)
            
            HStack {
                NavigationLink(destination: PharmacyView(env: env)) {
                    Image("pharmacy")
                        .resizable()
                        .scaledToFill()
                    
                }
                .frame(width: 175, height: 75)
                .padding()
                NavigationLink(destination: EstisharaView(env: env)) {
                    Image("estishara")
                        .resizable()
                        .scaledToFill()
                    
                }
                .frame(width: 175, height: 75)
                .padding()
            }
            .padding(20)
            HStack {
                NavigationLink(destination: FavoriteView(env: env)) {
                    Image("Favorite")
                        .resizable()
                        .scaledToFill()
                    
                }
                .frame(width: 175, height: 75)
                .padding()
                NavigationLink(destination: CartView(env: env)) {
                    Image("cart")
                        .resizable()
                        .scaledToFill()
                    
                }
                .frame(width: 175, height: 75)
                .padding()
            }
            .padding(20)
            Spacer()
        }
        .navigationBarTitle("") //this must be empty
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

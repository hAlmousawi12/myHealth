//
//  EstisharaView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/30/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct EstisharaView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            VStack(alignment: .trailing) {
                Text("")
                    .font(.title)
                    .foregroundColor(.theme.secondary)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Image("1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        Image("2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        Image("3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        Image("4")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        Image("5")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                        Image("6")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 200)
                    }
                }
            }
            VStack(alignment: .trailing) {
                Text("افضل الدكاترة")
                    .font(.title)
                    .foregroundColor(.theme.secondary)
                Image("Fatima")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 75)
                Image("Bdr")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 75)
                    .padding(.vertical)
            }
            Spacer()
        }
    }
}

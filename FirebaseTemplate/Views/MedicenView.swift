//
//  MedicenView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/29/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct MedicenView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            
            HStack {
                Text("12:30")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 20)
                    .padding(3)
                    .background(Color.blue)
                    .clipShape(Capsule())
                Spacer()
                VStack(alignment: .trailing) {
                    Text("اسبرين")
                    Text("1 * 100mg")
                        .font(.caption)
                        .foregroundColor(.theme.secondary)
                }
                Image("asprin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            .padding(10)
            .frame(width: 350, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .padding()
            
            HStack {
                Text("18:00")
                    .foregroundColor(.white)
                    .frame(width: 50, height: 20)
                    .padding(3)
                    .background(Color.blue)
                    .clipShape(Capsule())
                Spacer()
                VStack(alignment: .trailing) {
                    Text("ايبوبروفين")
                    Text("2 * 50mg")
                        .font(.caption)
                        .foregroundColor(.theme.secondary)
                }
                Image("aibobrophine")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 75, height: 75)
            }
            .padding(10)
            .frame(width: 350, height: 100)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .padding()
            
            Text("دواء جديد")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 275, height: 50)
                .background(Color.theme.red)
                .clipShape(Capsule())
                .padding()
            Spacer()
        }
    }
}

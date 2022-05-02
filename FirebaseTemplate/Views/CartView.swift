//
//  CartView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/30/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct CartView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            Spacer()
            Image("Group 1812")
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 75)
            Spacer()
            VStack(alignment: .trailing, spacing: 10) {
                Text("ملخص الدفع")
                    .font(.title2)
                HStack {
                    Text("10،000د.ك")
                        .font(.title3)
                    Spacer()
                    Text("المجموع")
                        .font(.title3)
                }
            }.padding()
            HStack {
                Text("تنفيذ الطلب")
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50)
                    .background(Color.red)
                    .clipShape(Capsule())
                NavigationLink(destination: PharmacyView(env: env)) {
                    Text("اضافة المزيد  ")
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.red)
                        .clipShape(Capsule())
                }

            }.padding()
        }
    }
}

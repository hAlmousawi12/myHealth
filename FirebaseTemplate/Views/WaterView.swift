//
//  WaterView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/29/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct WaterView: View {
    @StateObject var env: FirebaseEnv
    @State var selection = 1
    var body: some View {
        VStack {
            Header(env: env)
            VStack(alignment: .trailing) {
                Text("جسمك يحتاج الى سوائل")
                    .font(.title2)
                    .padding()
                HStack {
                    Image(systemName: "cup.and.saucer")
                    Text("1.5ل من 3ل")
                }
                
                VStack {
                    HStack(alignment: .bottom) {
                        VStack(alignment: .trailing) {
                            Text("150مل")
                                .font(.title2)
                            Text("=150مل من الماء")
                        }
                        Image(systemName: "cup.and.saucer")
                            .font(.largeTitle)
                    }
                    
                    Picker("", selection: $selection) {
                        Text("30ml").tag(1)
                        Text("50ml").tag(2)
                        Text("100ml").tag(3)
                        Text("150ml").tag(4)
                        Text("200ml").tag(5)
                        Text("250ml").tag(6)
                        Text("300ml").tag(7)
                        Text("330ml").tag(8)
                        Text("500ml").tag(9)
                        Text("1000ml").tag(10)
                    }.pickerStyle(WheelPickerStyle())
                    
                    Text("اضف ماء")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .background(Color.theme.red)
                        .clipShape(Capsule())
                        .padding()
                }
                .frame(width: 300)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            }
            Spacer()
        }
    }
}

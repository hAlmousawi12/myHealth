//
//  StepsView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/28/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct StepsView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            Spacer()
            
            Text("المجموع")
                .font(.title3)
                .foregroundColor(.theme.secondary)
            
            HStack {
                Image(systemName: "figure.walk")
                Text("خطوة")
                    .foregroundColor(.theme.secondary)
                Text("Step")
            }
            Image("chart")
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 100)
            Spacer()
        }
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        StepsView()
    }
}

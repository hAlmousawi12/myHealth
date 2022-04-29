//
//  AlertView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/18/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct AlertView: View {
    var msg: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.theme.sec)
            
            Text(msg)
                .foregroundColor(.theme.sec)
            
            Button(action: {
                // closing popup
                show.toggle()
            }) {
                Text("Close")
                    .foregroundColor(.theme.onp)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                    .background(Color.theme.p)
                    .cornerRadius(15)
            }
            
            // centering the button
            .frame(alignment: .center)
        }
        .padding()
        .background(Color.theme.bg)
        .cornerRadius(15)
        .padding(.horizontal, 25)
        
        // background dim
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

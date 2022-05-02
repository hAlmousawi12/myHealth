//
//  FavoriteView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/30/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        VStack {
            Header(env: env)
            Spacer()
            Text("المفضلة")
                .font(.largeTitle)
                .foregroundColor(.theme.secondary)
            
            VStack(alignment: .trailing) {
                Text("الاطباء")
                    .foregroundColor(.theme.secondary)
                    .font(.title2)
                    .fontWeight(.semibold)
                Doctor(isFav: true, doctorName: "د. تامر عباس", doctorType: "دكتور عيون", color: .blue)
                
                Doctor(isFav: true, doctorName: "د. مريم", doctorType: "دكتور عيون", color: .orange)
                    .padding(.vertical)
            }.padding()
            VStack(alignment: .trailing) {
                Text("الادوية")
                    .foregroundColor(.theme.secondary)
                    .font(.title2)
                    .fontWeight(.semibold)
                Image("Group 1818")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 75)
                Image("k")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 75)
            }.padding()
            Spacer()
        }
    }
}

struct Doctor: View {
    var isFav: Bool
    var doctorName: String
    var doctorType: String
    var color: Color
    var body: some View {
        HStack {
            Image(systemName: isFav ? "star.fill" : "star")
                .foregroundColor(isFav ? .yellow : .black)
                .font(.title)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(doctorName)
                Text(doctorType)
                    .font(.caption2)
            }
            Circle()
                .foregroundColor(color)
                .frame(width: 45, height: 45)
            
        }
        .padding(10)
        .frame(width: 300, height: 75)
        .background(color.opacity(0.3))
        .cornerRadius(10)
    }
}

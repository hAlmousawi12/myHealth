//
//  PharmacyView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/30/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct PharmacyView: View {
    @StateObject var env: FirebaseEnv
    @State var selection: Category = .bestSeller
    var body: some View {
        VStack {
            Header(env: env)
            Picker("", selection: $selection) {
                ForEach(Category.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.vertical)
            Spacer()
            Image(selection.rawValue)
                .resizable()
                .scaledToFit()
            
            Spacer()
        }
    }
}



enum Category: String, CaseIterable {
    case bestSeller = "الاكثر مبيعاً"
    case medicine = "الادوية"
    case nose = "بخاخ الانف"
    case vit = "الفيتامينات"
    case place = "الموضعية"
}

//
//  SettingsView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/27/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @State var isOn = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .trailing, spacing: 15) {
                Text("الاعدادات العامة")
                    .foregroundColor(.theme.secondary)
                Setting(name: "اللغة")
                Setting(name: "العنوان")
                Setting(name: "حول")
            }
            VStack(alignment: .trailing, spacing: 15) {
                Text("الدعم الفني")
                    .foregroundColor(.theme.secondary)
                Setting(name: "تواصل معنا")
                Setting(name: "الاسالة الاكثر شيوعاً")
            }
            VStack(alignment: .trailing, spacing: 15) {
                Text("الخصوصية")
                    .foregroundColor(.theme.secondary)
                Setting(name: "الشروط و الاحكام")
                Setting(name: "سياسة الخصوصية")
            }
            VStack(alignment: .trailing, spacing: 15) {
                Text("تسجيل الدخول")
                    .foregroundColor(.theme.secondary)
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 1)
                    HStack {
                        Image("face-id")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        Toggle("", isOn: $isOn)
                        Spacer()
                        Text("Face Id")
                    }.padding()
                }.frame(width: 350, height: 50)
                Setting(name: "تسجيل الخروج")
                Setting(name: "تغيير كلمة السر")
            }
        }
    }
}

struct Setting: View {
    var name: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 1)
            HStack {
                Image(systemName: "chevron.left")
                Spacer()
                Text(name)
            }.padding()
        }.frame(width: 350, height: 50)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

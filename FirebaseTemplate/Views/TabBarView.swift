//
//  TabBarView.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/29/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var env: FirebaseEnv
    var body: some View {
        TabView {
            Home(env: env)
                .tabItem {
                    Label {
                        Text("الملخص")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            
            PagesView(env: env)
                .tabItem {
                    Label {
                        Text("الصفحات")
                    } icon: {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            
            Search()
                .tabItem {
                    Label {
                        Text("البحث")
                    } icon: {
                        Image(systemName: "magnifyingglass")
                    }
                }
            
        }.navigationBarHidden(true)
    }
}

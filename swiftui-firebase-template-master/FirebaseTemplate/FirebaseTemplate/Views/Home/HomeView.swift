//
//  HomeView.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/6/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Button("Sign Out") {
            Networking.signOut()
        }.foregroundColor(.red)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

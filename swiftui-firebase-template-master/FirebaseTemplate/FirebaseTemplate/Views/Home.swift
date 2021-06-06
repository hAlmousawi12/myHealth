//
//  Home.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 12/27/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI


struct SignOutButton: View{
    var env: FirebaseEnv
    var body: some View{
        Button("Signout") {
            env.signOut()
        }
        .foregroundColor(.red)
    }
}

struct Home: View {
    @EnvironmentObject var env: FirebaseEnv
    let itemsEnvironment = ItemsEnv()
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("you are signed in!") , content: {
                    NavigationLink("Add a new item", destination: AddItem()
                                    .environmentObject(itemsEnvironment))
                    NavigationLink("List all items", destination: ListItems()
                                    .environmentObject(itemsEnvironment))
                })
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing: SignOutButton(env: env))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(FirebaseEnv())
    }
}

//
//  TextFieldShape.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/7/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct TextFieldShape: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 350, height: 50)
            .padding(2)
            .background(Color.white)
            .clipShape(Capsule())
            .padding(2)
            .background(Color.black)
            .clipShape(Capsule())
    }
}

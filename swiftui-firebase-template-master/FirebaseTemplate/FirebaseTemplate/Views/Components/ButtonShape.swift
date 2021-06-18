//
//  ButtonShape.swift
//  FirebaseTemplate
//
//  Created by Hussain on 6/17/21.
//  Copyright © 2021 OMAR. All rights reserved.
//

import SwiftUI

struct ButtonShape: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 50)
            .background(Color.theme.red)
            .clipShape(Capsule())
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
}

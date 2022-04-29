//
//  customNumberPad.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/18/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

struct customNumberPad: View {
    @Binding var value: String
    var ifVerify: Bool
    
    // Number Data
    var rows = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "", "0", "delete.left"]
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 3), spacing: 15) {
                    ForEach(rows, id: \.self) { value in
                        Button(action: {
                            buttonAction(value: value)
                        }) {
                            ZStack {
                                if value == "delete.left" {
                                    Image(systemName: value)
                                        .font(.title)
                                        .foregroundColor(.theme.onbg)
                                } else {
                                    Text(value)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.theme.onbg)
                                }
                            }
                            .frame(width: getWidth(frame: reader.frame(in: .global)), height: getHeight(frame: reader.frame(in: .global)))
                            .background(Color.theme.wb)
                            .cornerRadius(10)
                        }
                        // disabling Button for empty action
                        .disabled(value == "")
                    }
                }
            }
        }
        .padding()
    }
    
    // Getting height and width for dynamic sizing
    func getWidth(frame: CGRect) -> CGFloat {
        let width = frame.width
        
        let actualWidth = width - 40
        
        return actualWidth / 3
    }
    
    func getHeight(frame: CGRect) -> CGFloat {
        let height = frame.height
        
        let actualHeight = height - 30
        
        return actualHeight / 4
    }
    
    func buttonAction(value: String) {
        if value == "delete.left" && self.value != "" {
            self.value.removeLast()
        }
        
        if value != "delete.left" {
            if ifVerify {
                if self.value.count < 6 {
                    self.value.append(value)
                }
            } else {
                self.value.append(value)
            }
        }
    }
}

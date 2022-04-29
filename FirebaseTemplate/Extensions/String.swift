//
//  String.swift
//  FirebaseTemplate
//
//  Created by Hussain Almousawi on 4/27/22.
//  Copyright © 2022 OMAR. All rights reserved.
//

import SwiftUI

extension StringProtocol  {
    var digits: [Int] { compactMap(\.wholeNumberValue) }
}

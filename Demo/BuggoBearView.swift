//
//  BuggoBearView.swift
//  Demo
//
//  Created by Martin Kim Dung-Pham on 11.09.19.
//  Copyright © 2019 Martin Kim Dung-Pham. All rights reserved.
//

import SwiftUI

struct BuggoBearView: View {
    var body: some View { VStack(content: {
        Text("🐻").font(.system(size: 80)).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)).zIndex(1)
        Text("🐞").font(.system(size: 64)).padding(EdgeInsets(top: -50, leading: 0, bottom: 0, trailing: 0))
    })
    }
}

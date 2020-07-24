//
//  ViewRBG.swift
//  RBGView
//
//  Created by Aleksandr Kurdiukov on 24.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct ViewRBG: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Color(red: red, green: green, blue: blue)
            .frame(width: 300, height: 150)
            .cornerRadius(40)
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth: 8))
    }
}

struct ViewRBG_Previews: PreviewProvider {
    static var previews: some View {
        ViewRBG(red: 0.5, green: 0, blue: 0.7)
    }
}

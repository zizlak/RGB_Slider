//
//  SliderHStack.swift
//  RBGView
//
//  Created by Aleksandr Kurdiukov on 24.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct SliderHStack: View {

@Binding var sliderValue: Double
@Binding var text: String

let accentColor: Color

var body: some View {
    
    HStack{
        Text("\(Int(sliderValue))")
            .frame(width: CGFloat(40))
        
        Slider(value: $sliderValue, in: 0...255, step: 1.0){_ in
            self.text = "\(Int(self.sliderValue))"
        }
        .accentColor(accentColor)
        
        TextField("", text: $text) {
            self.setText()
        }
            
        .multilineTextAlignment(.center)
        .frame(width: 60)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .keyboardType(.numbersAndPunctuation)
        .padding(.trailing, 10)
    }
   .preferredColorScheme(.dark)
}
    
    private func setText() {

        if let double = Double(self.text) {
            
            switch double {
            case ..<0:
                self.sliderValue = 0
            case 0...255:
                self.sliderValue = double
            default:
                self.sliderValue = 255
            }
        }
        self.text = "\(Int(self.sliderValue))"
    }
}

struct SliderHStack_Previews: PreviewProvider {
    static var previews: some View {
        SliderHStack(sliderValue: .constant(23), text: .constant("111"), accentColor: .red)
    }
}

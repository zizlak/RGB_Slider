//
//  ContentView.swift
//  RBGView
//
//  Created by Aleksandr Kurdiukov on 24.07.20.
//  Copyright © 2020 Zizlak. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: Private Elements
    
    @State private var red = 0.0
    @State private var green = 0.0
    @State private var blue = 0.0
    
    @State private var textRed = "0"
    @State private var textGreen = "0"
    @State private var textBlue = "0"
    
    
    //MARK: Body
    
    var body: some View {
        
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                ViewRBG(red: red/255, green: green/255, blue: blue/255)
                    .padding(EdgeInsets(top: 20, leading: 0, bottom: 40, trailing: 0))
                
                SliderHStack(sliderValue: $red, text: $textRed, accentColor: .red)
                SliderHStack(sliderValue: $green, text: $textGreen, accentColor: .green)
                SliderHStack(sliderValue: $blue, text: $textBlue, accentColor: .blue)
                Spacer()
            }
        }
    }
}


//MARK: SliderHStack
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
            .multilineTextAlignment(.center)
            .frame(width: 60)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numbersAndPunctuation)
            .padding(.trailing, 10)
        }
        .preferredColorScheme(.dark)
    }
    
    
    //MARK: Preview
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}

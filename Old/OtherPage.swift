//
//  OtherPage.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct OtherPageView: View {

    var body: some View {
        
        VStack {
            
            TextField("   ", text: $meows) //https://developer.apple.com/documentation/swiftui/textfield
                .foregroundStyle(.white) //foreground of the TEXT
                .font(.system(size: 48, weight: .black, design: .serif)) //https://developer.apple.com/documentation/swiftui/text
                .scaledToFit()
            
            //https://developer.apple.com/documentation/SwiftUI/Button
            Button() {
                meows += "Meow! "
            } label: {
                Text("Tap to meow!")
                    .foregroundColor(.pink)
            }
            .background(.white)
            .cornerRadius(8)
            
            ZStack { // stacks are on top of each other, there is no format
                MyCircle()
                    .padding(5)// puts padding around only the struct attached to
                    .opacity(0.55) // changed the opacity of the circle it is attached to
                    .offset(CGSize(width: 15, height: 0))// https://developer.apple.com/documentation/swiftui/view/offset(_:)
                MyCatImage().padding(25) // the order they are in matters to what order they are in on the page
                MyHeart() //decor
                    .padding(150)
                    .offset(CGSize(width: 175, height: 175))
            }
            
        }
        .frame(width: 500, height: 500) // using frame, i can avoid using .padding to keep everything the same size
    }
}

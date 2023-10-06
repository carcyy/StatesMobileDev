//
//  AlertPage.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct AlertPageView: View {
    @State private var pressed = false
    
    var body: some View {
        
        Button() {
            pressed = true
        } label: {
            Text("What's This?")
                .foregroundColor(.pink)
        }
        .background(.white)
        .cornerRadius(8)
        
        .alert(isPresented: $pressed) { //is presented based on if it has been pressed
            Alert(
                title: Text("WARNING!"),
                message: Text("You pressed the button!")
            )}
    }//https://developer.apple.com/documentation/swiftui/alert
}//I know that this is depreciated but it was so much easier to understand than the other one

//
//  Gradient.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct GradientBack: View { // one of the "modifiers" I made, which I found through Apple Developer: https://developer.apple.com/documentation/swiftui/lineargradient
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottom, endPoint: .top)
    }
}

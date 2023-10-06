//
//  Cat.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct MyCatImage: View {
    var body: some View {
        Image("kittyCat")
            .resizable()
            .scaledToFit()
            .clipShape(Circle()) //makes the image take on a circular shape: https://developer.apple.com/documentation/swiftui/view/clipshape(_:style:)
    }
}

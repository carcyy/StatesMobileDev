//
//  Heart.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct MyHeart: View {
    var body: some View {
        Image("redHeart")
            .resizable() // this makes it so that it fits on the view, squished under what already exists in view (text/circle)
            .scaledToFit()// this makes it the correct size in respect to aspect ratio/view of parent. This one helps the edges look better too for some reason instead of ".aspectRatio(contentMode: .fit)" which was also found: https://developer.apple.com/documentation/swiftui/image
    }
}

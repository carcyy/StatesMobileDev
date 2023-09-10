//
//  ContentView.swift
//  Assignment 1 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var meows = ""//empty string state, https://developer.apple.com/documentation/swiftui/state
    
    var body: some View {
        ZStack {
            
            VStack { //vertical stack
                
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
                    myCircle()
                        .padding(5)// puts padding around only the struct attached to
                        .opacity(0.55) // changed the opacity of the circle it is attached to
                        .offset(CGSize(width: 15, height: 0)) //https://developer.apple.com/documentation/swiftui/view/offset(_:)
                    myCatImage().padding(25) // the order they are in matters to what order they are in on the page
                    myHeart().padding(130)
                        .offset(CGSize(width: -100, height: -75))
                }
            }
            .background(gradient()) //added a background using the gradient struct/function, moved background gradient out of ContentView
        }
    }
}

//after some exploring on the internet, this is just the struct that provides us the ***DISPLAY PREVIEW: meaning that nothing in here makes it into the final compile, just a preview in Xcode.
struct ContentView_Previews:  PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct myCircle: View { //struct for displaying circle
    var body: some View {
            Circle()
                .foregroundStyle(.red)
                
    }
}

struct myHeart: View {
    var body: some View {
            Image("redHeart")
                .resizable() // this makes it so that it fits on the view, squished under what already exists in view (text/circle)
                .scaledToFit()// this makes it the correct size in respect to aspect ratio/view of parent. This one helps the edges look better too for some reason instead of ".aspectRatio(contentMode: .fit)" which was also found: https://developer.apple.com/documentation/swiftui/image
    }
}

struct myCatImage: View {
    var body: some View {
        Image("kittyCat")
            .resizable()
            .scaledToFit()
            .clipShape(Circle()) //makes the image take on a circular shape: https://developer.apple.com/documentation/swiftui/view/clipshape(_:style:)
    }
}

struct gradient: View { // one of the "modifiers" I made, which I found through Apple Developer: https://developer.apple.com/documentation/swiftui/lineargradient
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottom, endPoint: .top)
    }
}

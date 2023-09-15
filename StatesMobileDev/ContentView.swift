//
//  ContentView.swift
//  Assignment 1 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            
        ZStack {
            NavigationView {
                VStack {
                    NavigationLink("Home") {
                
                    }.offset(CGSize(width: 10, height: -300))
                    NavigationLink("Other") {
                        
                    }.offset(CGSize(width: 10, height: -300))
                }
            }.navigationTitle("Page Options")
                .offset(CGSize(width: -30, height: 0))
            
                TabView {
                    HelloPageView()
                        .tabItem {
                            Text("Home")
                        }
                    OtherPageView()
                        .tabItem {
                            Text("Other")
                        }
                    AlertPageView()
                        .tabItem {
                            Text("Alert")
                        }
                    ModalSheetView()
                        .tabItem {
                            Text("Sheet")
                        }
                }
        }.background(GradientBack())
    }
}
        
        //after some exploring on the internet, this is just the struct that provides us the ***DISPLAY PREVIEW: meaning that nothing in here makes it into the final compile, just a preview in Xcode.
        struct ContentView_Previews:  PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
        // Remember to name uppercase for structs
        struct MyCircle: View { //struct for displaying circle
            var body: some View {
                Circle()
                    .foregroundStyle(.red)
                
            }
        }
        
        struct MyHeart: View {
            var body: some View {
                Image("redHeart")
                    .resizable() // this makes it so that it fits on the view, squished under what already exists in view (text/circle)
                    .scaledToFit()// this makes it the correct size in respect to aspect ratio/view of parent. This one helps the edges look better too for some reason instead of ".aspectRatio(contentMode: .fit)" which was also found: https://developer.apple.com/documentation/swiftui/image
            }
        }
        
        struct MyCatImage: View {
            var body: some View {
                Image("kittyCat")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle()) //makes the image take on a circular shape: https://developer.apple.com/documentation/swiftui/view/clipshape(_:style:)
            }
        }
        
        struct GradientBack: View { // one of the "modifiers" I made, which I found through Apple Developer: https://developer.apple.com/documentation/swiftui/lineargradient
            var body: some View {
                LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .bottom, endPoint: .top)
            }
        }
        
struct OtherPageView: View {
    @State private var meows = ""//empty string state, https://developer.apple.com/documentation/swiftui/state
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

struct HelloPageView: View {
    var body: some View {
        
        
        VStack {
            Text("Welcome to Carson's App!")
            MyHeart().padding(100)
            }.frame(width: 500, height: 500)
            .padding(100)
    }
    
}

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

struct ModalSheetView: View { //https://developer.apple.com/documentation/SwiftUI/View/sheet(isPresented:onDismiss:content:)
    @State private var sheetShow = false
    
       var body: some View {
           Button() {
               sheetShow = true
           } label: {
               Text("Who goes there?")
                   .foregroundColor(.pink)
           }
           .background(.white)
           .cornerRadius(8)
           .sheet(isPresented: $sheetShow, //the sheet is presented when sheetShow is true (button press)
                  onDismiss: didDismiss) {
                       VStack {
                           Text("Meow!")
                               .font(.title)
                               .padding(50)
                           MyCatImage()
                               .padding(50)
                           Button("Cute!",
                                  action: { sheetShow.toggle() }) // when the button labeled cute is pressed, then the onDismiss will toggle true and the sheet is dismissed
                       }.frame(width: 500, height: 500)
                           .padding(50)
                   }
               }
       func didDismiss() {
           // Handle the dismissing action. (apple)
    }
}

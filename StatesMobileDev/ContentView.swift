//
//  ContentView.swift
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            TabView {
                NavigationStack {
                    HelloPageView()
                        .navigationTitle("Welcome")
                }
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                NavigationStack {
                    OtherPageView()
                        .navigationTitle("Cat")
                        .background(GradientBack())
                }
                .tabItem {
                    Label("Other", systemImage: "questionmark.app.fill")
                }
                NavigationStack {
                    AlertPageView()
                        .navigationTitle("Alert Example")
                }
                .tabItem {
                    Label("Alert", systemImage: "hand.raised.square.on.square.fill")
                }
                NavigationStack {
                    ModalSheetView()
                        .navigationTitle("Modal Sheet Example")
                }
                .tabItem {
                    Label("Sheet", systemImage: "square.filled.on.square")
                }
                
                NavigationStack {
                    ArtPieceView()
                        .navigationTitle("API Import Example")
                }
                .tabItem {
                    Label("API", systemImage: "doc.text.below.ecg.fill")
                }
            }
            
        }
    }
    
    //after some exploring on the internet, this is just the struct that provides us the ***DISPLAY PREVIEW: meaning that nothing in here makes it into the final compile, just a preview in Xcode.
    struct ContentView_Previews:  PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

//
//  ContentView.swift
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var homeViewModel = HomeViewModel()
    @StateObject private var otherViewModel = OtherViewModel()
    @StateObject private var alertViewModel = AlertViewModel()
    @StateObject private var modalViewModel = ModalViewModel()
    @StateObject private var apiViewModel = ApiViewModel()

       var body: some View {
           TabView {
               NavigationStack {
                   homeViewModel.HomeView()
                       .navigationTitle("Welcome")
                       .environmentObject(homeViewModel)
               }
               .tabItem {
                   Label("Home", systemImage: "house.fill")
               }
                NavigationStack {
                    otherViewModel.OtherView()
                        .navigationTitle("Cat")
                        .background(GradientBack())
                        .environmentObject(otherViewModel)
                }
                .tabItem {
                    Label("Other", systemImage: "questionmark.app.fill")
                }
                NavigationStack {
                    alertViewModel.AlertView()
                        .navigationTitle("Alert Example")
                        .environmentObject(alertViewModel)
                }
                .tabItem {
                    Label("Alert", systemImage: "hand.raised.square.on.square.fill")
                }
                NavigationStack {
                    modalViewModel.ModalView()
                        .navigationTitle("Modal Sheet Example")
                        .environmentObject(modalViewModel)
                }
                .tabItem {
                    Label("Sheet", systemImage: "square.filled.on.square")
                }
                
                NavigationStack {
                    apiViewModel.ApiView()
                        .navigationTitle("API Import Example")
                        .environmentObject(apiViewModel)
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

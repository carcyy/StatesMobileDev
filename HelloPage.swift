//
//  HelloPage.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

struct HelloPageView: View {
    var body: some View {
        
        
        VStack {
            Text("Welcome to Carson's App!")
            MyHeart().padding(100)
        }.frame(width: 500, height: 500)
            .padding(100)
    }
    
}

//
//  ModalPage.swift
//  StatesMobileDev
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/7/23.
//

import SwiftUI

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

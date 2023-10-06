//
//  ArtworkAPI.swift
//  Assignment 1, 2, 3, 4, & 5 Carson Holub
//
//  Created by CUBS Customer (Carson Holub) on 9/27/23.
//

import SwiftUI

struct ArtworksResponse: Codable { // my API is not an Array of data, but instead JSONs within JSON, I know there are 4 but I want to read from the data section. I know that the data section has the variables below present.
    let data: [Artwork]
}

struct Artwork: Codable, Identifiable { // these are identiable within the JSON file as specifically defined variables, therefore we search for them
    let id: Int
    let title: String?
    let description: String? // for some reason even though the API says there are descriptions, all of them come up NULL (and I know that I'm in the right section so that was puzzling.
    let alt_text: String?
    let date_display: String?
    let artist_display: String?
    let credit_line: String?
    let dimensions: String? // as I learned, all of these could potentially be null
}

struct ArtPieceView: View {
    @State private var artworks: [Artwork] = [] // an array that holds the information from data, so the titles etc
    @State private var selectedArtwork: Artwork? = nil  // attempting to get the button to work based on the artwork selected, it can be null potentially so we need to prepare for that by setting empty to null
    @State private var sheetShow = false
    
    var body: some View {
        NavigationView {
            List(artworks) { artwork in // my list was capped at 12 via the API, if I knew how to change that I would've presented more
                VStack(alignment: .leading) {
                    Text("\(artwork.title ?? "A wonderful work of art") • \(artwork.dimensions ?? "At the perfect size")") // I learned that if you are going to be working with NULL variables at all, then you will be using the ? mark to differentiate that. ?? just means, if the variable is null, what would the output be instead
                    
                    
                    Button() {
                        selectedArtwork = artwork // selects the artwork where the button is located, this works for now but it prevents me from choosing a starter artwork
                        sheetShow = true // then show the sheet
                    } label: {
                        Text("Show Details")
                            .foregroundColor(.pink)
                    }
                    .sheet(isPresented: $sheetShow) {
                        if let selectedArtwork = selectedArtwork {
                            ArtworkDetailSheet(artwork: selectedArtwork, sheetShow: $sheetShow)
                        } else {
                            Text("Error Occured.") // unfortunately the first artwork selected will always show error because it hasn't been ID'd
                            
                            Button("Close") {
                                sheetShow = false
                            }
                            .background(.white)
                            .cornerRadius(8)
                            .padding(20)
                            
                        }
                    }
                }
            }
            .task {
                await fetchArtworks()
            }
        }
        .navigationTitle("Artworks")
    }
    
    func fetchArtworks() async -> () {
        do {
            let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(ArtworksResponse.self, from: data)
            artworks = response.data
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func didDismiss() {

    }
}
        

struct ArtworkDetailSheet: View {
    let artwork: Artwork // based on this artwork, which is a the variable used above when choosing the button
    @Binding var sheetShow: Bool // if true then show the sheet
    
    var body: some View {
        VStack {
            Text("Artwork Details:")
                .font(.title)
                .padding(50)
            
            Text("\(artwork.title ?? "A wonderful work of art.")")
                .font(.title)
                .padding(25)
            
            Text("Artist Display:")
                .font(.title2)
            Text("\(artwork.artist_display ?? "None listed.")")
                .padding(10)
            
            Text("Date Display:")
                .font(.title2)
            Text("\(artwork.date_display ?? "None listed.")")
                .padding(10)
            
            Text("Credits:")
                .font(.title2)
            Text("\(artwork.credit_line ?? "None listed.")")
                .padding(10)
            
            Button("Close") {
                sheetShow = false
            }
            .background(.white)
            .cornerRadius(8)
            .padding(20)
        }
    }
}


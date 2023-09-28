//
//  ArtworkAPI.swift
//  StatesMobileDev
//
//  Created by CUBS Customer on 9/28/23.
//

import SwiftUI

struct ArtworksResponse: Codable { // my API is not an Array of data, but instead JSONs within JSON, I know there are 4 but I want to read from the data section. I know that the data section has the variables below present.
    let data: [Artwork]
}

struct Artwork: Codable, Identifiable { // these are identiable within the JSON file as specifically defined variables, therefore we search for them
    let id: Int
    let title: String
    //let alt_text: String?
    //let date_display: String
    //let artist_display: String I was trying to get these to work but I am not sure how to avoid NULL data
}

struct ArtPieceView: View {
    @State private var artworks: [Artwork] = [] // an array that holds the information from data, so the titles etc
    @State private var selectedArtwork: Artwork? // attempting to get the button to work based on the artwork selected
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationView {
            List(artworks) { artwork in
                VStack(alignment: .leading) {
                    Text("\(artwork.title) • ")
                    
                    Button("Show Details") {
                        
                    }
                    .sheet(isPresented: $isSheetPresented) {
                        if let artwork = selectedArtwork {
                            ArtworkDetailSheet(artwork: artwork, isSheetPresented: $isSheetPresented) // present the modal sheet
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
}

struct ArtworkDetailSheet: View { // this part is basically empty, but it would hold invididual data
    let artwork: Artwork
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        VStack {
            Text("Artwork Details:")
                .font(.title)
                .padding(50)
            
            //Text("Title: \(artwork.title),")
            // Add more artwork details here
            
            //                if let altText = artwork.alt_text {
            //                                Text("Alt Text: \(altText)")
            //                            } else {
            //                                Text("Alt Text: Not available")
            //                            }
            
            Button("Close") {
                isSheetPresented = false
            }
            .padding()
        }
    }
}


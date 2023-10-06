import SwiftUI

struct ApiView: View {
    @EnvironmentObject var apiViewModel: ApiViewModel

    var body: some View {
        NavigationView {
            List(apiViewModel.artworks) { artwork in // my list was capped at 12 via the API, if I knew how to change that I would've presented more
                VStack(alignment: .leading) {
                    Text("\(apiViewModel.artwork.title ?? "A wonderful work of art") • \(apiViewModel.artwork.dimensions ?? "At the perfect size")") // I learned that if you are going to be working with NULL variables at all, then you will be using the ? mark to differentiate that. ?? just means, if the variable is null, what would the output be instead
                    
                    
                    Button() {
                        apiViewModel.selectedArtwork = apiViewModel.artwork // selects the artwork where the button is located, this works for now but it prevents me from choosing a starter artwork
                        apiViewModel.sheetShowApi = true // then show the sheet
                    } label: {
                        Text("Show Details")
                            .foregroundColor(.pink)
                    }
                    .sheet(isPresented: $apiViewModel.sheetShowApi) {
                        if let selectedArtwork = apiViewModel.selectedArtwork {
                            ArtworkDetailSheet(apiViewModel.artwork: selectedArtwork, apiViewModel.sheetShow: $apiViewModel.sheetShow)
                        } else {
                            Text("Error Occured.") // unfortunately the first artwork selected will always show error because it hasn't been ID'd
                            
                            Button("Close") {
                                apiViewModel.sheetShow = false
                            }
                            .background(.white)
                            .cornerRadius(8)
                            .padding(20)
                            
                        }
                    }
                }
            }
            .task {
                await apiViewModel.fetchArtworks()
            }
        }
        .navigationTitle("Artworks")
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



struct ApiView_Previews: PreviewProvider {
    static var previews: some View {
        ApiView()
    }
}


import SwiftUI

struct ApiView: View {
    @EnvironmentObject var apiViewModel: ApiViewModel
    
    var body: some View {
        NavigationView {
            List(apiViewModel.artworks) { artwork in // my list was capped at 12 via the API, if I knew how to change that I would've presented more
                VStack(alignment: .leading) {
                    Text("\(artwork.title ?? "A wonderful work of art") • \(artwork.dimensions ?? "At the perfect size")") // I learned that if you are going to be working with NULL variables at all, then you will be using the ? mark to differentiate that. ?? just means, if the variable is null, what would the output be instead
                    
                    Button() {
                        apiViewModel.selectedArtwork = artwork // selects the artwork where the button is located, this works for now but it prevents me from choosing a starter artwork
                        apiViewModel.sheetShowApi = true //then show the sheet
                    } label: {
                        Text("Show Details")
                            .foregroundColor(.pink)
                    }
                    .sheet(isPresented: $apiViewModel.sheetShowApi) {
                        if let selectedArtwork = apiViewModel.selectedArtwork { //possibilities for this to be nil could cause issues right now but im just happy it actually works after being broken for an extra 2 hrs (so i left the warning)
                            apiViewModel.artworkDetailSheet()
                        } else {
                            Text("Error Occurred.") // unfortunately the first artwork selected will always show error because it hasn't been ID'd
                            
                            Button("Close") {
                                apiViewModel.sheetShowApi = false
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

    
    
    struct ApiView_Previews: PreviewProvider {
        static var previews: some View {
            ApiView()
        }
    }

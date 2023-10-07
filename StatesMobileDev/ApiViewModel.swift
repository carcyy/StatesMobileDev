import Foundation
import SwiftUI

class ApiViewModel: ObservableObject {
    @Published var artworks: [ApiModel.Artwork] = []
    @Published var selectedArtwork: ApiModel.Artwork? = nil
    @Published var sheetShowApi: Bool = false
    
    init() {
        //fetchArtworks()
    }
    
    func fetchArtworks() async ->() {
        do {
            let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(ApiModel.ArtworksResponse.self, from: data)
            //artworks = response.data     publishing changes from the background is not allowed
            
            DispatchQueue.main.async { //this allows us to correctly
                self.artworks = response.data
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func artworkDetailSheet() -> some View{ // this was probably the hardest section for me to get working. I probably could've done this differently but it was hard to keep variables and structs out of the view. If this goes in the view it needs @states and that kind of breaks the whole point of doing MVVM for me
        if let selectedArtwork = selectedArtwork{ // considering the artwork inside the func allows me to pass no variables to be ammended data, they are ammended here
            return AnyView( // i have to use the function to RETURN a view...
                VStack {
                    Text("Artwork Details:")
                        .font(.title)
                        .padding(50)
                    
                    Text("\(selectedArtwork.title ?? "A wonderful work of art.")")
                        .font(.title)
                        .padding(25)
                    
                    Text("Artist Display:")
                        .font(.title2)
                    Text("\(selectedArtwork.artist_display ?? "None listed.")")
                        .padding(10)
                    
                    Text("Date Display:")
                        .font(.title2)
                    Text("\(selectedArtwork.date_display ?? "None listed.")")
                        .padding(10)
                    
                    Text("Credits:")
                        .font(.title2)
                    Text("\(selectedArtwork.credit_line ?? "None listed.")")
                        .padding(10)
                    
                    Button("Close") {
                        self.sheetShowApi = false
                    }
                    .background(.white)
                    .cornerRadius(8)
                    .padding(20)
                    
                }
            )
        } else {
            return AnyView( // so if its null it returns nothing
            Text("None")
            )
        }
    }
}

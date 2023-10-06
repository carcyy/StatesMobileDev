import Foundation

class ApiViewModel: ObservableObject {
    @Published var artworks: [ApiModel.Artwork] = []
    @Published var selectedArtwork: ApiModel.Artwork? = nil
    @Published var sheetShowApi = false
        
    init() {
        fetchArtworks()
    }
    
    func fetchArtworks(){
        async {
            do {
                let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(ApiModel.ArtworksResponse.self, from: data)
                artworks = response.data
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

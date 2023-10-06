struct ApiModel{
    struct ArtworksResponse: Codable {
        let data: [Artwork]
    }

    struct Artwork: Codable, Identifiable {
        let id: Int
        let title: String?
        let description: String?
        let alt_text: String?
        let date_display: String?
        let artist_display: String?
        let credit_line: String?
        let dimensions: String?
    }
}

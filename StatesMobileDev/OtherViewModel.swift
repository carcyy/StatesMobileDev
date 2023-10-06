import Foundation

class OtherViewModel: ObservableObject {
        
    @Published var meows: String = ""
    //"" //empty string state, https://developer.apple.com/documentation/swiftui/state
        
    init() {
        //none
    }
}

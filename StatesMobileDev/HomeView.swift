import SwiftUI

struct HomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Text("Welcome to Carson's App!")
            MyHeart().padding(100)
        }.frame(width: 500, height: 500)
            .padding(100)
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

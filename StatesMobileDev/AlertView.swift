import SwiftUI

struct AlertView: View {
    @EnvironmentObject var alertViewModel: AlertViewModel

    var body: some View {
            Button() {
                alertViewModel.pressed = true
            } label: {
                Text("What's This?")
                    .foregroundColor(.pink)
            }
            .background(.white)
            .cornerRadius(8)
            
            .alert(isPresented: $alertViewModel.pressed) { //is presented based on if it has been pressed
                Alert(
                    title: Text("WARNING!"),
                    message: Text("You pressed the button!")
                )
            }
        }
    }

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}

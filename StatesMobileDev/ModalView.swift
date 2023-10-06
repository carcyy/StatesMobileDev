import SwiftUI

struct ModalView: View {
    @EnvironmentObject var modalViewModel: ModalViewModel
    
    var body: some View {
        VStack {
            Button() {
                modalViewModel.sheetShow = true
            } label: {
                Text("Who goes there?")
                    .foregroundColor(.pink)
            }
            .background(.white)
            .cornerRadius(8)
            .sheet(isPresented: $modalViewModel.sheetShow) {//the sheet is presented when sheetShow is true (button press)
                VStack {
                    Text("Meow!")
                        .font(.title)
                        .padding(50)
                    MyCatImage()
                        .padding(50)
                    Button("Cute!",
                           action: { modalViewModel.sheetShow.toggle() }) // when the button labeled cute is pressed, then the onDismiss will toggle true and the sheet is dismissed
                }.frame(width: 500, height: 500)
                    .padding(50)
            }
        }
    }
    
    struct ModalView_Previews: PreviewProvider {
        static var previews: some View {
            ModalView()
        }
    }
}

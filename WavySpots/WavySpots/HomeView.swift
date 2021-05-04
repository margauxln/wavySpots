import SwiftUI
struct HomeView: View {
  var body: some View {
    VStack(alignment: .leading) {
        HStack {
            CircleImage()
            VStack(alignment: .leading) {
                Text("Wavy Spots")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Darkblue"))
                Text("Best Places to surf ")
                  .foregroundColor(Color("BlueOcean"))
                  .font(Font.system(size:20, design: .default))
            }
        }
        BoxView(image: "surf", place: "Point Break", description: "Supertubes, Jeffreys Bay, South Africa")
        Spacer()
        
    }
    .padding()
  }
}
struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .environment(\.sizeCategory, .extraSmall)
      .previewDevice("iPhone 12 Pro Max")
  }
}

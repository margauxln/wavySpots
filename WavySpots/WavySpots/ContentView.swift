import SwiftUI
struct ContentView: View {
  var body: some View {
    VStack(alignment: .leading) {
      Text("Wavy Spots")
        .font(.title)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .foregroundColor(Color("Darkblue"))
        .frame(width: nil)
      HStack {
        Text("Best Places to surf ")
          .foregroundColor(Color("BlueOcean"))
          .font(Font.system(size:20, design: .default))
        Spacer()
                Text("Hossegor")
                  .font(.subheadline)
      }
        SurfImage()
        MapView()
    }
    .padding()
  }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.sizeCategory, .extraSmall)
      .previewDevice("iPhone 12 Pro Max")
  }
}

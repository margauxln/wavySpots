import SwiftUI
//var spots = [ Spot(id: 1, SurfBreak: "Reef Break" , Photos: "surf1", Address: "Pipeline, Oahu, Hawaii"),
//              Spot(id: 2, SurfBreak: "Point Break" , Photos: "surf2", Address: "Supertubes, Jeffreys Bay, South Africa")
//]


struct HomeView: View {
    @State var product: Records?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                CircleImage(photo:"logoSurf")
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

            NavigationView {
                List {
                    ForEach(product?.records ?? [], id: \.self) { Spot in
                        NavigationLink(
                            destination: DestinationPageView(spot:Spot)
                        ) {
                            BoxView(image: Spot.fields.Photos[0].url, place: Spot.fields.Address, description: Spot.fields.Surfbreak[0])
                        }
                    }

                }
                .onAppear {
                    Api().getSpots { spots in
                        product = spots
                    }
               }
            }
            Spacer()

        }
        .padding()
    }
}
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//            .environment(\.sizeCategory, .extraSmall)
//            .previewDevice("iPhone 12 Pro Max")
//    }
//}
//

 

import SwiftUI

struct HomeView: View {
    @State var isNavigationBarHidden: Bool = true

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
                .navigationBarHidden(self.isNavigationBarHidden)
                            .onAppear {
                                self.isNavigationBarHidden = true
                            }
                
            }

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

 

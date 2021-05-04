import SwiftUI
var spots = [ Spot(id: 1, SurfBreak: "Reef Break" , Photos: "surf1", Address: "Pipeline, Oahu, Hawaii"),
              Spot(id: 2, SurfBreak: "Point Break" , Photos: "surf2", Address: "Supertubes, Jeffreys Bay, South Africa")
]
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
            
            NavigationView {
                List {
                    ForEach(spots, id: \.self) { spot in
                        NavigationLink(
                            destination: DestinationPageView(id:spot.id)
                        ) {
                            BoxView(image: spot.Photos, place: spot.SurfBreak, description: spot.Address)
                        }
                    }
                    
                }
            }
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


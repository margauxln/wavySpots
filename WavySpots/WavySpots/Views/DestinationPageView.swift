//
//  DestinationPageView.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import SwiftUI

struct DestinationPageView: View {
    var spot : Spot?
    init(spot: Spot){self.spot = try? Spot}

    var body: some View {
        Text(spot?.fields.Surfbreak[0] ?? "erreur")
        .font(.title)
        .foregroundColor(Color("Darkblue"))
        Text(spot?.fields.Address ?? "erreur")
        .font(.subheadline)
        CircleImage(photo:spot?.fields.Photos[0].url ?? "erreur")
      MapView()
    }
}

//struct DestinationPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        DestinationPageView(id:1)
//    }
//}

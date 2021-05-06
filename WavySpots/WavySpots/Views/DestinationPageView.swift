//
//  DestinationPageView.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import SwiftUI

struct DestinationPageView: View {
    var spot : Spot
    init(spot: Spot){self.spot = spot}

    var body: some View {
        Text(spot.fields.Address)
            .font(.title)
            .foregroundColor(Color("Darkblue"))
        Text(spot.fields.Surfbreak[0])
            .font(.subheadline)
        CircleImage(photo:spot.fields.Photos[0].url )
      MapView()
    }
}

//struct DestinationPageView_Previews: PreviewProvider {
//    static var previews: some View {
//        DestinationPageView(id:1)
//    }
//}

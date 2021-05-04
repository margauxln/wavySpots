//
//  DestinationPageView.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import SwiftUI

struct DestinationPageView: View {
    var id = 0
    init(id:Int){self.id = id}
    var body: some View {
      Text("Hossegor")
        .font(.title)
        .foregroundColor(Color("Darkblue"))
      Text("La plage des bogosse")
        .font(.subheadline)
      CircleImage()
      MapView()
    }
}

struct DestinationPageView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationPageView()
    }
}

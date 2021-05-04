//
//  surfImage.swift
//  WavySpots
//
//  Created by Fanny Armand on 03/05/2021.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("logoSurf")
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            .shadow(radius: 7)
            
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}

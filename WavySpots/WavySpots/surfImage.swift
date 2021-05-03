//
//  surfImage.swift
//  WavySpots
//
//  Created by Fanny Armand on 03/05/2021.
//

import SwiftUI

struct SurfImage: View {
    var body: some View {
        Image("surf")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct SurfImage_Previews: PreviewProvider {
    static var previews: some View {
        SurfImage()
    }
}

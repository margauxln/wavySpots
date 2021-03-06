//
//  BoxView.swift
//  WavySpots
//
//  Created by Fanny Armand on 04/05/2021.
//

import SwiftUI
import URLImage

struct BoxView: View {
    var image = ""
    var place = ""
    var description = ""
    var url = URL(string: "https://dl.airtable.com/ZuXJZ2NnTF40kCdBfTld_thomas-ashlock-64485-unsplash.jpg")!
    init(image:String, place:String, description: String) {
        self.image = image
        self.place = place
        self.description = description
        if let url = URL(string: self.image){
            self.url = url
        }
    }
    var body: some View {
        HStack {
            URLImage(url: self.url,
                           content: { image in
                            image
                                .resizable()
                                .frame(width: 75, height: 60)
                                .aspectRatio(contentMode: .fit)
                           })
    
                     VStack(alignment: .leading) {
                        Text(self.place)
                            .font(Font.system(size:18, design: .default))
                        Text(self.description)
                            .font(Font.system(size:13, design: .default))
                     }
            }
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView(image: "surf", place: "Point Break", description: "Supertubes, Jeffreys Bay, South Africa")
    }
}

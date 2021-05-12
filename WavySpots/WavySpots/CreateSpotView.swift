//
//  CreateSpotView.swift
//  WavySpots
//
//  Created by Fanny Armand on 11/05/2021.
//

import SwiftUI

struct SurfBreak {
    static let allSurfBreaks = [
        "Point Break",
        "Reef Break",
        "River Bar",
        "Rivermouth Break",
        "Jetty Break",
        "Outer Banks",
    ]
}

struct CreateSpotView: View {
    @State var address: String = ""
    @State private var surfBreak: String = ""
    @State var photo : String = ""
    var body: some View {
        NavigationView {
            Form {
                TextField("Destination", text: $address)
                Picker(selection: $surfBreak,
                       label: Text("Surf Break")) {
                    ForEach(SurfBreak.allSurfBreaks, id: \.self) { surfBreak in
                        Text(surfBreak).tag(surfBreak)
                    }
                }
                TextField("Photo", text: $photo)
                Button(action: {
                    Api().addSpot()
                    print("Save Spot")
                }) {
                    HStack {
                        Image(systemName: "bookmark.fill")
                        Text("Save Spot")
                    }.padding(10.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(lineWidth: 2.0)
                    )
                }
                
            }
            .navigationBarTitle("Add Spot")
            
        }
        
    }
}

//struct CreateSpotView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateSpotView()
//    }
//}



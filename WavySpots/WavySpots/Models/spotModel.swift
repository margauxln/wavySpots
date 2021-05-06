//
//  spotModel.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import Foundation

struct Spot: Hashable, Codable {
    var id: String
    var fields: Fields
}
struct Records: Codable {
    var records: [Spot]
}
struct Fields: Codable {
    
    
    var Address : String
    var Photos : [Photos]
    var Surfbreak : [String]
    
    enum CodingKeys: String, CodingKey {
        case Surfbreak = "Surf Break"
        case Address
        case Photos
    }
}
struct Photos: Hashable, Codable{
    var url : String
}


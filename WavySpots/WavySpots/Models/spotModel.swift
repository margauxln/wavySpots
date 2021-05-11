//
//  spotModel.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import Foundation
import SwiftUI

struct Spot: Hashable, Codable {
    static func == (lhs: Spot, rhs: Spot) -> Bool {
        if (lhs.id == rhs.id){
            return true
        }else{
            return false
        }
    }
    
    var id: String
    var fields: Fields
}
struct Records: Codable {
    var records: [Spot]
}
struct Fields: Hashable, Codable {
    
    
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

class Api {
    func getSpots(completion: @escaping(Records) -> ()) {
        guard let url = URL(string:"https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations?api_key=keyTbt7JjwqkfNnYn") else {return}
        URLSession.shared.dataTask(with: url) { (data,_,_)in
            let decoder = JSONDecoder()
            let spots = try? decoder.decode(Records.self, from: data!)
            DispatchQueue.main.async {
                completion(spots!)
            }
        }
        .resume()
    }
    func addSpot()->() {
        // Prepare URL
        let url = URL(string: "https://api.airtable.com/v0/appxT9ln6ixuCb3o1/Surf%20Destinations?api_key=keyTbt7JjwqkfNnYn")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "Address=Le conquet&Surfbreak=Beach Break&Photos=https://www.surfing-iroise.com/wp-content/uploads/2017/06/drone_surfing_iroise_blancs_sablons.jpg";
        
        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
        }
        task.resume()
        
    }
}

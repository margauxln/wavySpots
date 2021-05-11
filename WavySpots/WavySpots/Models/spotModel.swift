//
//  spotModel.swift
//  WavySpots
//
//  Created by Marine Luciani on 04/05/2021.
//

import Foundation
import SwiftUI

struct Spot: Hashable, Codable {
//    static func == (lhs: Spot, rhs: Spot) -> Bool {
//        if (lhs.id == rhs.id){
//            return true
//        }else{
//            return false
//        }
//    }
    
    //var id : String
    var fields: Fields
    
    //private enum CodingKeys: String, CodingKey {
    //    case fields
    //}
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
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPhoto = Photos(url:"https://www.surfing-iroise.com/wp-content/uploads/2017/06/drone_surfing_iroise_blancs_sablons.jpg")
        let newField = Fields(Address: "LeConquet", Photos: [newPhoto], Surfbreak: ["Point Break"])
        let newSpot = Spot(fields: newField)
        let jsonData = try? JSONEncoder().encode(newSpot)
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else {return}
            do{
                let string = String(decoding:data,as: UTF8.self)
                print (string)
                let newSpot = try JSONDecoder().decode(Spot.self, from: data)
                print("Response data:\n \(newSpot)")
                print("todoItemModel Title: \(newSpot.fields)")
                //print("todoItemModel id: \(newSpot.id)")
            }catch let jsonErr{
                print(jsonErr)
            }
            
        }
        task.resume()
        
    }
}

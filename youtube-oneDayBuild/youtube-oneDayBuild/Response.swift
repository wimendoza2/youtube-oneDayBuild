//
//  resoponse.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 24/2/22.
//

import Foundation

struct Response: Decodable {
    var items: [Video]?
    
    enum codingKeys:String , CodingKey{
        
        case items
    }
    
//    init (from decoder: Decoder) throws {
//        
//        let container = try decoder.container(keyedBy: codingKeys.self)
//       
//        self.items = try container.decode(  [Video].self, forKey: .items)
//    }
}

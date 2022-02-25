//
//  video.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 8/2/22.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    
    enum codingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
     
    }
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: codingKeys.self)
    
        let snippetContainer = try container.nestedContainer(keyedBy: codingKeys.self, forKey: .snippet )
        
        //parse title
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //parse Description
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        
        //Parse the publish date
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse the thumbnails
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse the videoId
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: codingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
    
}

//
//  CacheManager.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 1/3/22.
//

import Foundation

class CacheManager {
    
    static var cache = [String:Data]()
     
    static func setVideoCache(_ url:String, _ data:Data?){
        //store the imaga data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String ) -> Data?{
        // Try to get the data for the specified url
        
        return cache[url]
    }
}

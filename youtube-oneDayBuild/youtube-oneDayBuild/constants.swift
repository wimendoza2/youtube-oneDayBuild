//
//  constants.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 8/2/22.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAPu34IIvS0uPLQyNL7yvJVWeP8HB4ODRE"
    static var PLAYLIST_ID = "RD26xAtkF8h5g"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}

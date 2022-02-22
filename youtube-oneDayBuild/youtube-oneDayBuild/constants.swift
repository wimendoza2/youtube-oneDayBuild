//
//  constants.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 8/2/22.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyA3MpUZj_UFQ6c1LZYXHY6cT3lFhG6jw3o"
    static var PLAYLIST_ID = "RD26xAtkF8h5g"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
}

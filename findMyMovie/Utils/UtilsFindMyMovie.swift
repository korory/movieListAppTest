//
//  UtilsFindMyMovie.swift
//  findMyMovie
//
//  Created by Arnau Rivas Rivas on 11/04/2020.
//  Copyright © 2020 Arnau Rivas Rivas. All rights reserved.
//

import Foundation

var CONSTANTS = Constants()

struct Constants {
    let BASEURL = BaseURL()
}

struct BaseURL {
    let ITUNESBASEURLMOVIE = "https://rss.itunes.apple.com/api/v1/es/movies/top-movies/action-and-adventure/10/explicit.json"
}

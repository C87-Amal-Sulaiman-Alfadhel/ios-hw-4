//
//  File.swift
//  hw4
//
//  Created by Amal Alfadhel on 10/7/20.
//

import Foundation

struct Song {
    var name: String
    var artistName: String
    
}

struct Artists {
    var artist: String
}
 
var musicData = [
    Song(name: "Sweater Weather", artistName: "The Neighbourhood"),
    Song(name: "Wiped Out!", artistName: "The Neighbourhood"),
    Song(name: "R.I.P. 2 My Youth", artistName: "The Neighbourhood"),
    Song(name: "The Beach", artistName: "The Neighbourhood"),
    Song(name: "Ferrari", artistName: "The Neighbourhood"),
    Song(name: "Wires", artistName: "The Neighbourhood")
]

var artists = [
    Artists(artist: "The Neighbourhood"),
    Artists(artist: "Post Malone"),
    Artists(artist: "Khalid"),
    Artists(artist: "Travis Scott"),
    Artists(artist: "Logic")
]

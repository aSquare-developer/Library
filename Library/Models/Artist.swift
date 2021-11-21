//
//  Artist.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

struct Artist {
    let name: String
    let musicGenre: MusicGenre
    let photo: String
    let description: String
    let country: Country
    
    static func getListOfGenres () -> [MusicGenre] {
        var listOfMusicGenres: [MusicGenre] = []
        for genre in MusicGenre.allCases {
            listOfMusicGenres.append(genre)
        }
        return listOfMusicGenres
    }
    
    static func getArtist (_ genre: MusicGenre) -> [Artist] {
        var listOfArtists: [Artist] = []
        let data = MusicDataManager().artist
        for artist in data {
            if artist.musicGenre == genre {
                listOfArtists.append(artist)
            }
        }
        return listOfArtists
    }
    
}


enum MusicGenre: String, CaseIterable {
    case rock = "Рок"
    case pop = "Поп"
    case rap = "Рэп"
}

enum Country: String, CaseIterable {
    case usa = "Америка"
    case uk = "Великобритания"
    case australia = "Австралия"
    case canada = "Канада"
}


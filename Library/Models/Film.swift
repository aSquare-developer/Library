//
//  Film.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

struct Film {
    let title: String
    let cinematicUniverse: CinematicUniverse
    let image: String
    let year: Int
    let country: [CountryList]
    let genre: [GenreList]
    let duration: Int
    let description: String
}

enum GenreList: String {
    case fantasy = "Фантастика"
    case comedy = "Комедия"
    case horrory = "Ужасы"
    case action_movie = "Боевик"
    case adventure = "Приключения"
    case drama = "Драма"
    case criminal = "Криминал"
    case thriller = "Триллер"
    case superhero = "Супергеройский фильм"
}

enum CinematicUniverse: String, CaseIterable {
    case marvel = "Киновселенная Marvel"
    case dc = "Киновселенная DS"
    case transformers = "Трансформеры"
}

enum CountryList: String {
    case usa = "США"
}

extension Film {
    
    static func getCategoryList() -> [CinematicUniverse] {
        
        var categoryList: [CinematicUniverse] = []
        
        for value in CinematicUniverse.allCases {
            categoryList.append(value)
        }
        
        return categoryList
    }
    
    static func getFilms(with category: CinematicUniverse) -> [Film] {
        var filmListWithCurrentCategory: [Film] = []
        let data = FilmDataManager().films
        
        data.forEach { film in
            if film.cinematicUniverse == category {
                filmListWithCurrentCategory.append(film)
            }
        }
        
        return filmListWithCurrentCategory
    }
    
}

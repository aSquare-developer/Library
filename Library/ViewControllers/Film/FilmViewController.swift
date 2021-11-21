//
//  FilmViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class FilmViewController: UIViewController {

    @IBOutlet var poster: UIImageView!
    @IBOutlet var year: UILabel!
    @IBOutlet var country: UILabel!
    @IBOutlet var genre: UILabel!
    @IBOutlet var duration: UILabel!
    @IBOutlet var desc: UITextView!
    
    var film: Film!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        title = film.title
        poster.image = UIImage(named: film.image)
        year.text = "Год: \(String(film.year))"
        country.text = "Страна: \(getCountries(film.country))"
        genre.text = "Жанр: \(getGenre(film.genre))"
        duration.text = "Продолжительность: \(String(film.duration))"
        desc.text = film.description
        
    }
    
    
    private func getCountries(_ countryList: [CountryList]) -> String {
        let stringArray = countryList.map { $0.rawValue }
        let string = stringArray.joined(separator: ", ")
        
        return string
    }
    
    private func getGenre(_ genreList: [GenreList]) -> String {
        let stringArray = genreList.map { $0.rawValue }
        let string = stringArray.joined(separator: ", ")
        
        return string
    }

}

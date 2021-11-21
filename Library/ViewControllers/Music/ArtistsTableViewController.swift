//
//  ArtistsTableViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class ArtistsTableViewController: UITableViewController {
    
    var genre: MusicGenre!
    var listOfArtists: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Артисты"
        listOfArtists = Artist.getArtist(genre)
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfArtists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath) as! CustomTableViewCell
        let artist = listOfArtists[indexPath.row]
        cell.nameLabel.text = "Артист: \(artist.name)"
        cell.imageOfArtist.image = UIImage(named: artist.photo)
        cell.imageOfArtist.layer.cornerRadius = cell.imageOfArtist.frame.size.height / 2
        cell.imageOfArtist.clipsToBounds = true
        cell.genreLabel.text = "Жанр: \(artist.musicGenre.rawValue)"
        cell.countryLabel.text = "Страна: \(artist.country.rawValue)"
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let artist = listOfArtists[indexPath.row]
        detailsVC.artist = artist
    }
}

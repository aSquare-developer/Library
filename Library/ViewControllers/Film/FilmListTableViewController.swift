//
//  FilmListTableViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class FilmListTableViewController: UITableViewController {
    
    var currentCategory: CinematicUniverse!
    private var filmList: [Film] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = currentCategory.rawValue
        filmList = Film.getFilms(with: currentCategory)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filmList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath)

        let film = filmList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = film.title
        content.image = UIImage(named: film.image)
        cell.contentConfiguration = content

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let filmVC = segue.destination as? FilmViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let film = filmList[indexPath.row]
        filmVC.film = film
    }
    

}

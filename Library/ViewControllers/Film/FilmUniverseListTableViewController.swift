//
//  FilmUniverseListTableViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class FilmUniverseListTableViewController: UITableViewController {
    
    let filmUniverseList = Film.getCategoryList()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Киновселенные"
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmUniverseList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmsCategoryCell", for: indexPath)

        let filmCategory = filmUniverseList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = filmCategory.rawValue
        cell.contentConfiguration = content

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let filmListVC = segue.destination as? FilmListTableViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        filmListVC.currentCategory = filmUniverseList[indexPath.row]
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    

}

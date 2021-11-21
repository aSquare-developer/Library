//
//  SerialCategoryViewController.swift
//  Library
//
//  Created by Artur Anissimov on 20.11.2021.
//

import UIKit

class SerialCategoryViewController: UITableViewController {

    var serialCategoryList = Serial.getCategoryList()

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serialCategoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serialCategoryCell", for: indexPath)
        let serialCategory = serialCategoryList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = serialCategory.rawValue
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let serialListVC = segue.destination as? SerialListViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let serialCategory = serialCategoryList[indexPath.row]
        serialListVC.currentCategory = serialCategory
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
}

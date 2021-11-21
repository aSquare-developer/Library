//
//  SerialListViewController.swift
//  Library
//
//  Created by Artur Anissimov on 20.11.2021.
//

import UIKit

class SerialListViewController: UITableViewController {

    var currentCategory: SerialCategory!
    private var serialList: [Serial] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = currentCategory.rawValue
        serialList = Serial.getSerials(with: currentCategory)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serialList.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serialCell", for: indexPath)
        let serial = serialList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: serial.image)
        content.text = serial.name
        cell.contentConfiguration = content
        return cell
    }
    
    
    // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let serialVC = segue.destination as? SerialViewController else { return }
         guard let indexPath = tableView.indexPathForSelectedRow else { return }
         let serial = serialList[indexPath.row]
         serialVC.serial = serial
     }

}

//
//  SerialViewController.swift
//  Library
//
//  Created by Artur Anissimov on 20.11.2021.
//

import UIKit

class SerialViewController: UIViewController {

    @IBOutlet var serialCoverImageView: UIImageView!
    @IBOutlet var serialCategoryLabel: UILabel!
    @IBOutlet var serialYearLabel: UILabel!
    @IBOutlet var sericalDescriptionTextView: UITextView!
    
    var serial: Serial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        title = serial.name
        serialCoverImageView.image = UIImage(named: serial.image)
        serialCategoryLabel.text = "Категория: \(serial.category.rawValue)"
        serialYearLabel.text = "Год выпуска: \(String(serial.year))"
        sericalDescriptionTextView.text = serial.description
    }

}

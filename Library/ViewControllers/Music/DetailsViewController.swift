//
//  DetailsViewController.swift
//  Library
//
//  Created by Artur Anissimov on 21.11.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var artistCover: UIImageView!
    @IBOutlet var textDescription: UILabel!
    
    var artist: Artist!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = artist.name
        artistCover.image = UIImage(named: artist.photo)
        textDescription.text = artist.description
        
    }
}

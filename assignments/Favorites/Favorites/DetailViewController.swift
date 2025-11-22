//
//  DetailViewController.swift
//  Favorites
//
//  Created by Leila on 21.11.2025.
//

import UIKit



class DetailViewController: UIViewController {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var yourReview: UILabel!
    
    var item: Items?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populate()
    }

    private func populate() {
        guard let item = item else { return }
        nameLabel.text = item.title
        subtitleLabel.text = item.subtitle
        descLabel.text = item.description
        yourReview.text = item.myThought
        itemImage.image = UIImage(named: item.imageName)
    }
}

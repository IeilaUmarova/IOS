//
//  ItamCell.swift
//  Favorites
//
//  Created by Leila on 21.11.2025.
//


import UIKit

struct Items {
    let imageName: String
    let title: String
    let subtitle: String
    let description: String
    let myThought: String
}

class ItemCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    func configure(with item: Items) {
        itemImage.image = UIImage(named: item.imageName)
        nameLabel.text = item.title
        descLabel.text = item.subtitle
    }
}


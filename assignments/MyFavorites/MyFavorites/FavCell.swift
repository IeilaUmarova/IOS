//
//  FavCell.swift
//  MyFavorites
//
//  Created by Leila on 10.11.2025.
//

import UIKit

struct FavItem {
    let imageName: String
    let title: String
    let subtitle: String
    let description: String
}

class FavCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemType: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    func configure(with item: FavItem) {
        itemImage.image = UIImage(named: item.imageName)
        itemName.text = item.title
        itemType.text = item.subtitle
        itemDescription.text = item.description
    }

}


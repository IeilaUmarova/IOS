//
//  MusicsTableController.swift
//  Favorites
//
//  Created by Leila on 22.11.2025.
//

import UIKit

class MusicsTableViewController: TabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Musics"
        tabBarItem = UITabBarItem(title: "Musics", image: UIImage(systemName: "music.note.list"), tag: 1)
        loadItems()
    }

    private func loadItems() {
        items = [
            Items(imageName: "ILostYou", title: "I Lost You", subtitle: "Havana, Yaar", description: "Explores the deep emotional pain and longing experienced after losing a loved one.", myThought: ""),
            Items(imageName: "WalkingAway", title: "Walking Away", subtitle: "Craig David", description: "Talks about leaving behind troubles and negativity to seek a better future.", myThought: ""),
            Items(imageName: "Лейла", title: "Лейла", subtitle: "Jah Khalib", description: "Describe a deep connection and symbolizing a desire for a perfect world where only the two lovers exist.", myThought: ""),
            Items(imageName: "YouWillNeverKnow", title: "You Will Never Know", subtitle: "Imany",  description: "Expresses the pain of unrequited love and the frustration of not being able to fully convey one's feelings to the other person.", myThought: ""),
            Items(imageName: "Позави", title: "Позави", subtitle: "Edgar", description: "The song builds a deep sense of intimacy and tension. Its cinematic production and heartfelt delivery make Pozavi a standout piece that resonates long after the final note.", myThought: ""),
            Items(imageName: "LostOnYou", title: "Lost On You", subtitle: "LP", description: "Talks about reminiscing on a past relationship filled with intensity and longing.", myThought: ""),
            Items(imageName: "Dov'eL’'amore", title: "Dov'e L'Amore", subtitle: "Cher", description: "Convey a deep yearning for the presence of the beloved, emphasizing the unmatched love and beauty felt, symbolizing the power of love to transcend physical distance.", myThought: ""),
            Items(imageName: "ShapeOfMyHeart", title: "Shape Of My Heart", subtitle: "Sting", description: "Explores the idea that outward appearances and actions may not always reflect one's true feelings", myThought: ""),
            Items(imageName: "NasiniElDonya", title: "Nasini El Donya", subtitle: "Ragheb Alama", description: "Talks about a deep love where the singer expresses their longing and devotion to their beloved.", myThought: ""),
            Items(imageName: "QusadEiny", title: "Qusad Einy", subtitle: "Amr Diab", description: "Talks about the strong connection between two individuals, emphasizing that their bond transcends physical distance.", myThought: "")
        ]
    }
}

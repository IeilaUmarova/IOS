//
//  MusicsTableController.swift
//  Favorites
//
//  Created by Leila on 22.11.2025.
//

import UIKit

class MoviesTableViewController: TabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 0)
        loadItems()
    }

    private func loadItems() {
        items = [
            Items(imageName: "TheGreenHornet", title: "The Green Hornet", subtitle: "Comady, Suspense, Action", description: "Following the death of his father, Britt Reid, heir to his father's large company, teams up with his late dad's assistant Kato to become a masked crime fighting team.", myThought: ""),
            Items(imageName: "BadBoys", title: "Bad Boys", subtitle: "Comady, Action, Crime", description: "Two hip detectives protect a witness to a murder while investigating a case of stolen heroin from the evidence storage room from their police precinct.", myThought: ""),
            Items(imageName: "TheDevilWearsPrada", title: "The Devil Wears Prada", subtitle: "Comady, Drama", description: "With an aspiration to become a journalist, Andy, a smart but sensible young graduate, travels to New York. She starts working as an assistant to one of the city's biggest high fashion magazine editors, the cynical Miranda Priestly.", myThought: ""),
            Items(imageName: "BadBoys2", title: "Bad Boys 2", subtitle: "Comady, Action, Crime", description: "Miami narcotics cops Mike Lowrey and Marcus Burnett investigate the flow of Ecstasy into Florida from a Cuban drug cartel.", myThought: ""),
            Items(imageName: "BadBoysRideOrDie", title: "Bad Boys Ride Or Die", subtitle: "Comady, Action, Crime", description: "When their late police captain gets linked to drug cartels, wisecracking Miami cops Mike Lowrey and Marcus Burnett embark on a dangerous mission to clear his name.", myThought: ""),
            Items(imageName: "BadBoysForLife", title: "Bad Boys For Life", subtitle: "Comady, Action, Crime", description: "Miami detectives Mike Lowrey and Marcus Burnett must face off against a mother-and-son pair of drug lords who wreak vengeful havoc on their city.", myThought: ""),
            Items(imageName: "F1", title: "F1", subtitle: "Action, Drama", description: "The film follows the duo as they navigate the competitive world of F1 racing, with Hayes facing his past while a rivalry develops between him and Pearce as they try to save the team from collapse.", myThought: ""),
            Items(imageName: "Friends", title: "Friends", subtitle: "Comady, Romance, Parody", description: "The personal and professional lives of six friends living in the Manhattan borough of New York City.", myThought: ""),
            Items(imageName: "MeetJoeBlack", title: "Meet Joe Black", subtitle: "Drama, Romance, Fantasy", description: "Death, who takes the form of a young man killed in an accident, asks a media mogul to act as his guide to teach him about life on Earth and, in the process, he falls in love with the mogul's daughter.", myThought: ""),
            Items(imageName: "HomeAlone", title: "Home Alone", subtitle: "Comady, Family", description: "An eight-year-old troublemaker, mistakenly left home alone, must defend his home against a pair of burglars on Christmas Eve.", myThought: "")
        ]
    }
}

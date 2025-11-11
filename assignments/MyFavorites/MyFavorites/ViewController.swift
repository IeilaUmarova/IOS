//
//  ViewController.swift
//  MyFavorites
//
//  Created by Leila on 10.11.2025.
//

import UIKit

struct Sections {
    let name: String
    let color: UIColor
    let emoji: String
}

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        data = [favMovies, favSongs, favBooks, favUniCourses]
    }
    
    var data: [[FavItem]] = []
    let sectionTitles = ["Movies📽️", "Songs🎶", "Books📚", "Uni Courses🎓"]
    
    let favMovies: [FavItem] = [
        FavItem(imageName: "TheGreenHornet", title: "The Green Hornet", subtitle: "Comady, Suspense, Action", description: "Following the death of his father, Britt Reid, heir to his father's large company, teams up with his late dad's assistant Kato to become a masked crime fighting team."),
        FavItem(imageName: "BadBoys", title: "Bad Boys", subtitle: "Comady, Action, Crime", description: "Two hip detectives protect a witness to a murder while investigating a case of stolen heroin from the evidence storage room from their police precinct."),
        FavItem(imageName: "BadBoys2", title: "Bad Boys 2", subtitle: "Comady, Action, Crime", description: "Miami narcotics cops Mike Lowrey and Marcus Burnett investigate the flow of Ecstasy into Florida from a Cuban drug cartel."),
        FavItem(imageName: "BadBoysRideOrDie", title: "Bad Boys Ride Or Die", subtitle: "Comady, Action, Crime", description: "When their late police captain gets linked to drug cartels, wisecracking Miami cops Mike Lowrey and Marcus Burnett embark on a dangerous mission to clear his name."),
        FavItem(imageName: "BadBoysForLife", title: "Bad Boys For Life", subtitle: "Comady, Action, Crime", description: "Miami detectives Mike Lowrey and Marcus Burnett must face off against a mother-and-son pair of drug lords who wreak vengeful havoc on their city."),
        FavItem(imageName: "F1", title: "F1", subtitle: "Action, Drama", description: "The film follows the duo as they navigate the competitive world of F1 racing, with Hayes facing his past while a rivalry develops between him and Pearce as they try to save the team from collapse."),
        FavItem(imageName: "Friends", title: "Friends", subtitle: "Comady, Romance, Parody", description: "The personal and professional lives of six friends living in the Manhattan borough of New York City."),
        FavItem(imageName: "MeetJoeBlack", title: "Meet Joe Black", subtitle: "Drama, Romance, Fantasy", description: "Death, who takes the form of a young man killed in an accident, asks a media mogul to act as his guide to teach him about life on Earth and, in the process, he falls in love with the mogul's daughter."),
        FavItem(imageName: "HomeAlone", title: "Home Alone", subtitle: "Comady, Family", description: "An eight-year-old troublemaker, mistakenly left home alone, must defend his home against a pair of burglars on Christmas Eve."),
        FavItem(imageName: "TheDevilWearsPrada", title: "The Devil Wears Prada", subtitle: "Comady, Drama", description: "With an aspiration to become a journalist, Andy, a smart but sensible young graduate, travels to New York. She starts working as an assistant to one of the city's biggest high fashion magazine editors, the cynical Miranda Priestly.")
    ]
        
    let favSongs: [FavItem] = [
        FavItem(imageName: "ILostYou", title: "I Lost You", subtitle: "Havana, Yaar", description: "Explores the deep emotional pain and longing experienced after losing a loved one."),
        FavItem(imageName: "WalkingAway", title: "Walking Away", subtitle: "Craig David", description: "Talks about leaving behind troubles and negativity to seek a better future."),
        FavItem(imageName: "Лейла", title: "Лейла", subtitle: "Jah Khalib", description: "Describe a deep connection and symbolizing a desire for a perfect world where only the two lovers exist."),
        FavItem(imageName: "YouWillNeverKnow", title: "You Will Never Know", subtitle: "Imany", description: "Expresses the pain of unrequited love and the frustration of not being able to fully convey one's feelings to the other person."),
        FavItem(imageName: "Позави", title: "Позави", subtitle: "Edgar", description: "The song builds a deep sense of intimacy and tension. Its cinematic production and heartfelt delivery make Pozavi a standout piece that resonates long after the final note."),
        FavItem(imageName: "LostOnYou", title: "Lost On You", subtitle: "LP", description: "Talks about reminiscing on a past relationship filled with intensity and longing."),
        FavItem(imageName: "Dov'eL’'amore", title: "Dov'e L'Amore", subtitle: "Cher", description: "Convey a deep yearning for the presence of the beloved, emphasizing the unmatched love and beauty felt, symbolizing the power of love to transcend physical distance."),
        FavItem(imageName: "ShapeOfMyHeart", title: "Shape Of My Heart", subtitle: "Sting", description: "Explores the idea that outward appearances and actions may not always reflect one's true feelings"),
        FavItem(imageName: "NasiniElDonya", title: "Nasini El Donya", subtitle: "Ragheb Alama", description: "Talks about a deep love where the singer expresses their longing and devotion to their beloved."),
        FavItem(imageName: "QusadEiny", title: "Qusad Einy", subtitle: "Amr Diab", description: "Talks about the strong connection between two individuals, emphasizing that their bond transcends physical distance.")
    ]
        
    let favBooks: [FavItem] = [
        FavItem(imageName: "КодДаВинчи", title: "Код Да Винчи", subtitle: "Автор: Дэн Браун", description: "Секретный код скрыт в работах Леонардо да Винчи. Только он поможет найти христианские святыни, дающие немыслимые власть и могущество. Ключ к величайшей тайне, над которой человечество билось веками, наконец может быть найден."),
        FavItem(imageName: "ЕгоПрощальныйПоклон", title: "Его Прощальный Поклон / Архив Шерлока Холмса", subtitle: "Автор: Артур Конан Дойл", description: "последний сборник из 12 детективных рассказов о Шерлоке Холмсе, опубликованный Артуром Конаном Дойлем. Он был выпущен в печать в 1927 году и включает рассказы, опубликованные в 1921—1927 гг."),
        FavItem(imageName: "ЗатерянныйМир", title: "Затерянный Мир", subtitle: "Автор: Артур Конан Дойл", description: "Это увлекательная история о чудаковатом профессоре Челленджере и его друзьях, открывших настоящий Затерянный Мир в неисследованном районе Южной Америки и обнаруживших в нем живых динозавров."),
        FavItem(imageName: "ДолинаСтраха", title: "Собака Баскервилей / Долина Страха", subtitle: "Автор: Артур Конан Дойл", description: "В этот сборник вошли два романа Конан Дойла о приключениях бессмертного тандема с Бейкер-стрит, 221-б, – великого сыщика Шерлока Холмса и его друга и ассистента доктора Уотсона."),
    ]
        
    let favUniCourses: [FavItem] = [
        FavItem(imageName: "English", title: "English", subtitle: "Teacher: Тасыбаев Д.Р", description: "A course focused on improving academic writing, speaking, and comprehension skills through practical communication tasks and modern learning materials."),
        FavItem(imageName: "DataBase", title: "Data Base", subtitle: "Teacher: Құралбаев А.Т", description: "An introduction to database concepts, including data modeling, SQL, normalization, and the fundamentals of designing efficient, scalable data systems."),
        FavItem(imageName: "SoftwareEngineer", title: "Software Engeneering", subtitle: "Teacher: Азимханов Б.Ғ", description: "A course covering software development principles, system design, project architecture, and industry-standard engineering practices."),
        FavItem(imageName: "IOS", title: "IOS Development", subtitle: "Teacher: Мырзакануров А.С", description: "A practical introduction to building iOS applications using Swift, Xcode, UI frameworks, and modern mobile development patterns."),
    ]

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavCell", for: indexPath)as! FavCell
        
        let item = data[indexPath.section][indexPath.row]
        
        cell.itemName.text = item.title
        cell.itemType.text = item.subtitle
        cell.itemDescription.text = item.description
        cell.itemImage.image = UIImage(named: item.imageName)
        
        return cell
    }
}

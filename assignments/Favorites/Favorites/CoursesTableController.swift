//
//  CoursesTableController.swift
//  Favorites
//
//  Created by Leila on 22.11.2025.
//

import UIKit

class CoursesTableViewController: TabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Courses"
        tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "graduationcap"), tag: 3)
        loadItems()
    }

    private func loadItems() {
        items = [
            Items(imageName: "English", title: "English", subtitle: "Teacher: Тасыбаев Д.Р", description: "A course focused on improving academic writing, speaking, and comprehension skills through practical communication tasks and modern learning materials.", myThought: ""),
            Items(imageName: "DataBase", title: "Data Base", subtitle: "Teacher: Құралбаев А.Т", description: "An introduction to database concepts, including data modeling, SQL, normalization, and the fundamentals of designing efficient, scalable data systems.", myThought: ""),
            Items(imageName: "SoftwareEngineer", title: "Software Engeneering", subtitle: "Teacher: Азимханов Б.Ғ", description: "A course covering software development principles, system design, project architecture, and industry-standard engineering practices.", myThought: ""),
            Items(imageName: "IOS", title: "IOS Development", subtitle: "Teacher: Мырзакануров А.С", description: "A practical introduction to building iOS applications using Swift, Xcode, UI frameworks, and modern mobile development patterns.", myThought: ""),
            Items(imageName: "PE", title: "PE", subtitle: "Teacher: Оразғалиева Т.Т", description: "Students engage in a variety of sports, exercises, and activities designed to develop strength, coordination, and endurance while learning the importance of cooperation, fair play, and personal well-being.", myThought: "")
        ]
    }
}

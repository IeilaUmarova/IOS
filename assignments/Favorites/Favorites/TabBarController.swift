//
//  TabBarController.swift
//  Favorites
//
//  Created by Leila on 21.11.2025.
//

import UIKit

class TabBarController: UITableViewController {
    
    var items: [Items] = []
    private let cellIdentifier = "ItemCell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.configure(with: item)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail", let item = sender as? Items {
            if let detailVC = segue.destination as? DetailViewController {
                detailVC.item = item
            } else if let nav = segue.destination as? UINavigationController,
                let detailVC = nav.topViewController as? DetailViewController {
                detailVC.item = item
            }
        }
    }
}


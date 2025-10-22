//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Leila on 20.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var carsImageView: UIImageView!
    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var carsTitelView: UILabel!
    
    let carsArrey = [
        ("Ferrari", "Scuderia Ferrari HP. \nMaranello, Italy. \nTeam Chief: Frédéric Vasseur. \nDrivers: Charles Leclerc, \nLewis Hamilton."),
        ("Mercedes", "Mercedes-AMG PETRONAS Formula One Team. \nBrackley, United Kingdom. \nTeam Chief: Toto Wolff. \nDrivers: George Russell, \nKimi Antonelli."),
        ("RedBullRacing", "Oracle Red Bull Racing. \nMilton Keynes, United Kingdom. \nTeam Chief: Laurent Mekies. \nDrivers: Max Verstappen, \nYuki Tsunoda."),
        ("RacingBulls", "Visa Cash App Racing Bulls Formula One Team. \nFaenza, Italy. \nTeam Chief: Alan Permane. \nDrivers: Liam Lawson, \nIsack Hadjar."),
        ("HaasF1Team", "MoneyGram Haas F1 Team. \nKannapolis, United States. \nTeam Chief: Ayao Komatsu. \nDrivers: Esteban Ocon, \nOliver Bearman."),
        ("AstonMartin", "Aston Martin Aramco Formula One Team. \nSilverstone, United Kingdom. \nTeam Chief: Andy Cowell. \nDrivers: Lance Stroll, \nFernando Alonso."),
        ("Williams", "Atlassian Williams Racing. \nGrove, United Kingdom. \nTeam Chief: James Vowles. \nDrivers: Alexander Albon, \nCarlos Sainz."),
        ("Alpine", "BWT Alpine Formula One Team. \nEnstone, United Kingdom. \nTeam Chief: Flavio Briatore. \nDrivers: Pierre Gasly, \nFranco Colapinto."),
        ("KickSauber", "Stake F1 Team Kick Sauber. \nHinwil, Switzerland. \nTeam Chief: Jonathan Wheatley. \nDrivers: Nico Hulkenberg, \nGabriel Bortoleto."),
        ("McLaren", "McLaren Formula 1 Team. \nWoking, United Kingdom. \nTeam Chief: Andrea Stella. \nDrivers: Oscar Piastri, \nLando Norris.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showRandomItem()
    }
    
    func showRandomItem() {
        let randomElement = carsArrey.randomElement()!
        carsImageView.image = UIImage(named: randomElement.0)
        carsTitelView.text = randomElement.1
    }
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        showRandomItem()
    }
}


//
//  ViewController.swift
//  DiceeApp
//
//  Created by Leila on 17.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var leftDiceImageView: UIImageView!
    
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    @IBOutlet weak var rollButton: UIButton!
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArrey = [
            UIImage(named: "dice1"),
            UIImage(named: "dice2"),
            UIImage(named: "dice3"),
            UIImage(named: "dice4"),
            UIImage(named: "dice5"),
            UIImage(named: "dice6")
        ]
        
        leftDiceImageView.image = diceArrey.randomElement()!
        rightDiceImageView.image = diceArrey.randomElement()!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleLabel = UILabel()
        titleLabel.text = "Dicee App :)"
        titleLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
        view.addSubview(titleLabel)
        
        leftDiceImageView.layer.cornerRadius = 20
        leftDiceImageView.clipsToBounds = true
        leftDiceImageView.layer.borderWidth = 2
        leftDiceImageView.layer.borderColor = UIColor.white.cgColor

        rightDiceImageView.layer.cornerRadius = 20
        rightDiceImageView.clipsToBounds = true
        rightDiceImageView.layer.borderWidth = 2
        rightDiceImageView.layer.borderColor = UIColor.white.cgColor
        
        rollButton.layer.cornerRadius = 15
        rollButton.clipsToBounds = true

    }
    
}


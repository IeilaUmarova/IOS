//
//  ViewController.swift
//  SuperheroRandomizerApp2
//
//  Created by Leila on 02.12.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var alignmentLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var combatLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var eyeHairLabel: UILabel!
    @IBOutlet weak var placeOfBirthLabel: UILabel!
    @IBOutlet weak var firstAppearanceLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var randomButton: UIButton!
    
    private var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        setPlaceholderTexts()
        randomButton.isEnabled = false
        loadAllHeroes()
    }
    
    private func configureUI() {
        title = "Superhero Randomizer"
        heroImage.contentMode = .scaleAspectFill
        heroImage.clipsToBounds = true
        heroImage.layer.cornerRadius = 10
        randomButton.layer.cornerRadius = 10
        randomButton.isEnabled = false
            
        spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        setPlaceholderTexts()
    }

    private func setPlaceholderTexts() {
        fullNameLabel.text = "Full name: —"
        alignmentLabel.text = "Alignment: —"
        intelligenceLabel.text = "Intelligence: —"
        strengthLabel.text = "Strength: —"
        speedLabel.text = "Speed: —"
        durabilityLabel.text = "Durability: —"
        powerLabel.text = "Power: —"
        combatLabel.text = "Combat: —"
        genderLabel.text = "Gender: —"
        raceLabel.text = "Race: —"
        heightLabel.text = "Height: —"
        weightLabel.text = "Weight: —"
        eyeHairLabel.text = "Eyes / Hair: —"
        placeOfBirthLabel.text = "Place of birth: —"
        firstAppearanceLabel.text = "First appearance: —"
        publisherLabel.text = "Publisher: —"
        heroImage.image = nil
    }
    
    // MARK: Networking — загрузить весь список героев
    private func loadAllHeroes() {
        spinner.startAnimating()
        NetworkManager.shared.fetchAllHeroes { [weak self] result in
            guard let self = self else { return }
            self.spinner.stopAnimating()
            switch result {
            case .success(let list):
                if list.isEmpty {
                    self.showAlert(title: "Ошибка", message: "Список героев пуст")
                    return
                }
                self.randomButton.isEnabled = true

                // Попробуем восстановить последний сохранённый ID
                if let lastID = Persistence.loadLastHeroID(), let savedHero = NetworkManager.shared.hero(by: lastID) {
                    self.display(hero: savedHero, animated: false)
                } else {
                    // иначе покажем случайного
                    if let hero = NetworkManager.shared.randomHero() {
                        self.display(hero: hero, animated: false)
                        Persistence.saveLastHeroID(hero.id)
                    }
                }

            case .failure(let error):
                self.showAlert(title: "Ошибка сети", message: error.localizedDescription)
            }
        }
    }
    
    @IBAction func randomTapped(_ sender: UIButton) {
        // маленькая защита: если не загружено — ничего
        guard !NetworkManager.shared.heroes.isEmpty else {
            showAlert(title: "Нет данных", message: "Список героев ещё не загружен")
            return
        }

        // показываем индикатор
        spinner.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            // выбираем случайного
            guard let hero = NetworkManager.shared.randomHero() else {
                DispatchQueue.main.async {
                    self.spinner.stopAnimating()
                    self.showAlert(title: "Ошибка", message: "Не удалось выбрать героя")
                }
                return
            }
            // обновляем UI на главном потоке
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.display(hero: hero, animated: true)
                // сохраняем выбор
                Persistence.saveLastHeroID(hero.id)
            }
        }
    }
    
    // MARK: Показать случайного героя
    private func showRandomHero(animated: Bool) {
        fullNameLabel.text = "Full name: \(hero.biography.fullName ?? "—")"
        alignmentLabel.text = "Alignment: \(hero.biography.alignment ?? "—")"
        intelligenceLabel.text = "Intelligence: \(hero.powerstats.intelligence?.description ?? "—")"
        strengthLabel.text = "Strength: \(hero.powerstats.strength?.description ?? "—")"
        speedLabel.text = "Speed: \(hero.powerstats.speed?.description ?? "—")"
        durabilityLabel.text = "Durability: \(hero.powerstats.durability?.description ?? "—")"
        powerLabel.text = "Power: \(hero.powerstats.power?.description ?? "—")"
        combatLabel.text = "Combat: \(hero.powerstats.combat?.description ?? "—")"
        genderLabel.text = "Gender: \(hero.appearance.gender ?? "—")"
        raceLabel.text = "Race: \(hero.appearance.race ?? "—")"
        heightLabel.text = "Height: \((hero.appearance.height ?? ["—"]).joined(separator: " / "))"
        weightLabel.text = "Weight: \((hero.appearance.weight ?? ["—"]).joined(separator: " / "))"
        eyeHairLabel.text = "Eyes / Hair: \(hero.appearance.eyeColor ?? "—") / \(hero.appearance.hairColor ?? "—")"
        placeOfBirthLabel.text = "Place of birth: \(hero.biography.placeOfBirth ?? "—")"
        firstAppearanceLabel.text = "First appearance: \(hero.biography.firstAppearance ?? "—")"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "—")"

        // Картинка: берём lg -> md -> sm -> xs
        let imageUrlString = hero.images.lg ?? hero.images.md ?? hero.images.sm ?? hero.images.xs
        if let urlString = imageUrlString, let url = URL(string: urlString) {
            // Kingfisher: устанавливает картинку асинхронно и кеширует
            // Добавим fade анимацию через options
            heroImage.kf.indicatorType = .activity
            heroImage.kf.setImage(with: url, options: [
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ])
        } else {
            // нет картинки — поставить placeholder
            heroImage.image = nil
        }
        // Если хочешь — можно добавить небольшую анимацию смены текста
        if animated {
            UIView.transition(with: self.view, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                // уже обновили лейблы выше; transition плавно покажет изменения
            }, completion: nil)
        }
    }

    // MARK: Удобный алерт
    private func showAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default))
        present(a, animated: true)
    }
}



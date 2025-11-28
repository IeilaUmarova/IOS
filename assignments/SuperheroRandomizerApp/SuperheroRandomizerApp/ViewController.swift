//
//  ViewController.swift
//  SuperheroRandomizerApp
//
//  Created by Leila on 28.11.2025.
//

import UIKit

struct SimpleHero: Codable {
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?
}

struct Biography: Codable {
    let fullName: String?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}

struct Images: Codable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}

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
    
    private var heroes: [SimpleHero] = []
    private let heroesURL = "https://akabab.github.io/superhero-api/api/all.json"
    private let imageCache = NSCache<NSString, UIImage>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setPlaceholderTexts()
        randomButton.isEnabled = false
        loadAllHeroes()
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
        guard let url = URL(string: heroesURL) else {
            showAlert(title: "Ошибка", message: "Неверный URL")
            return
        }

        // простая загрузка через URLSession
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // ошибки сети
            if let error = error {
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка сети", message: error.localizedDescription)
                }
                return
            }
            // проверяем данные
            guard let data = data else {
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка", message: "Сервер вернул пустой ответ")
                }
                return
            }
            // декодируем JSON в массив SimpleHero
            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([SimpleHero].self, from: data)
                DispatchQueue.main.async {
                    self.heroes = list
                    self.randomButton.isEnabled = true
                    // показываем первый случайный герой
                    self.showRandomHero(animated: false)
                }
            } catch {
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка парсинга", message: error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    // MARK: Random action (подключи кнопку в IB к этому действию)
    @IBAction func randomTapped(_ sender: UIButton) {
        showRandomHero(animated: true)
    }
    
    private func loadImage(urlString: String?, completion: @escaping (UIImage?) -> Void) {
        guard let s = urlString, let url = URL(string: s) else {
            completion(nil)
            return
        }

        // проверяем кэш
        if let cached = imageCache.object(forKey: s as NSString) {
            completion(cached)
            return
        }

        // скачиваем
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let img = UIImage(data: data) {
                self.imageCache.setObject(img, forKey: s as NSString)
                // ОБНОВЛЕНИЕ UI НА ГЛАВНОМ ПОТОКЕ
                DispatchQueue.main.async {
                    completion(img)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    // MARK: Показать случайного героя
    private func showRandomHero(animated: Bool) {
        guard !heroes.isEmpty else {
            showAlert(title: "Нет данных", message: "Список героев ещё не загружен")
                return
        }
        let hero = heroes.randomElement()!
        // Заполняем метки (без сложной логики)
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
        heightLabel.text = "Height: \((hero.appearance.height ?? ["—"]).joined(separator: "/"))"
        weightLabel.text = "Weight: \((hero.appearance.weight ?? ["—"]).joined(separator: "/"))"
        eyeHairLabel.text = "Eyes / Hair: \(hero.appearance.eyeColor ?? "—") / \(hero.appearance.hairColor ?? "—")"
        placeOfBirthLabel.text = "Place of birth: \(hero.biography.placeOfBirth ?? "—")"
        firstAppearanceLabel.text = "First appearance: \(hero.biography.firstAppearance ?? "—")"
        publisherLabel.text = "Publisher: \(hero.biography.publisher ?? "—")"

        // Картинка: выбираем lg -> md -> sm -> xs
        let imageUrl = hero.images.lg ?? hero.images.md ?? hero.images.sm ?? hero.images.xs
        // анимация: простая смена картинки
        if animated {
            UIView.transition(with: heroImage, duration: 0.3, options: .transitionCrossDissolve, animations:
        {
        self.heroImage.alpha = 0
            }, completion: { _ in
                self.loadImage(urlString: imageUrl) { image in
                self.heroImage.image = image
                UIView.animate(withDuration: 0.25) {
                self.heroImage.alpha = 1
                }
            }
        })
        // небольшая анимация кнопки
        UIView.animate(withDuration: 0.1, animations: {
            self.randomButton.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            }, completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.randomButton.transform = .identity
                }
            })
        } else {
            loadImage(urlString: imageUrl) { image in
                self.heroImage.image = image
            }
        }
    }

    // MARK: Удобный алерт
    private func showAlert(title: String, message: String) {
        let a = UIAlertController(title: title, message: message, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(a, animated: true, completion: nil)
    }
}


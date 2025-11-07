//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Leila on 05.11.2025.
//

import UIKit
import AVFoundation

struct Music {
    let name: String
    let artist: String
    let fileNum: Int
}

class ViewController: UIViewController {
    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var musicArtist: UILabel!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrev: UIButton!
    @IBOutlet weak var totalDuration: UILabel!
    @IBOutlet weak var changeMode: UIButton!
    
    var audioPlayer: AVAudioPlayer?
    
    let musicList: [Music] = [
        Music(name: "Shape Of My Heart", artist: "Sting", fileNum: 1),
        Music(name: "Walking Away", artist: "Craig David", fileNum: 2),
        Music(name: "Callin' U", artist: "Outlandish", fileNum: 3),
        Music(name: "Love Is", artist: "Пабло, Mr Lambo", fileNum: 4),
        Music(name: "Lost On You", artist: "LP", fileNum: 5),
        Music(name: "Aicha", artist: "Outlandish", fileNum: 6),
        Music(name: "Every Breath You Take", artist: "Sting", fileNum: 7),
        Music(name: "You Will Never Know", artist: "Imany", fileNum: 8)
    ]
//---------------------------------------------------------------------------------------
    var currentIndex = 0
    var isPlaying = false
    var isDarkMode = true
//---------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        playCurrentMusic()
        modeType()
    }
//---------------------------------------------------------------------------------------
    func playCurrentMusic() {
        let music = musicList[currentIndex]

        musicName.text = music.name
        musicArtist.text = music.artist
        musicImage.image = UIImage(named: "\(music.fileNum)")

        if let url = Bundle.main.url(forResource: "\(music.fileNum)", withExtension: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        }
        
        isPlaying = true
        buttonPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        
        let duration = audioPlayer?.duration ?? 0
        totalDuration.text = formatTime(duration)
    }
//---------------------------------------------------------------------------------------
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
//---------------------------------------------------------------------------------------
    func modeType() {
        if isDarkMode{
            view.backgroundColor = .black
            musicName.textColor = .white
            musicArtist.textColor = .white
            totalDuration.textColor = .white
            buttonPlay.tintColor = .white
            buttonNext.tintColor = .white
            buttonPrev.tintColor = .white
            changeMode.tintColor = .white
            view.layer.contents = UIImage(named: "background")?.cgImage
        }
        else{
            view.backgroundColor = .white
            musicName.textColor = .black
            musicArtist.textColor = .black
            totalDuration.textColor = .black
            buttonPlay.tintColor = .black
            buttonNext.tintColor = .black
            buttonPrev.tintColor = .black
            changeMode.tintColor = .black
            view.layer.contents = UIImage(named: "background2")?.cgImage
        }
    }
//---------------------------------------------------------------------------------------
    @IBAction func playPauseMusic(_ sender: UIButton){
        if isPlaying {
            audioPlayer?.pause()
            buttonPlay.setImage(UIImage(systemName: "play.fill"), for: .normal)
            isPlaying = false
        } else {
            audioPlayer?.play()
            buttonPlay.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            isPlaying = true
        }
    }
//---------------------------------------------------------------------------------------
    @IBAction func nextTap(_ sender: UIButton){
        currentIndex = (currentIndex + 1) % musicList.count
        playCurrentMusic()
    }
//---------------------------------------------------------------------------------------
    @IBAction func prevTap(_ sender: UIButton){
        currentIndex = (currentIndex - 1 + musicList.count) % musicList.count
        playCurrentMusic()
    }
//---------------------------------------------------------------------------------------
    @IBAction func changeModeTap(_ sender: UIButton){
        isDarkMode.toggle()
        modeType()
    }
}


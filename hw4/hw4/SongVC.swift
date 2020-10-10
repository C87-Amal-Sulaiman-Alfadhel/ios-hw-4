//
//  SongVC.swift
//  hw4
//
//  Created by Amal Alfadhel on 10/7/20.
//

import UIKit
import AVFoundation

class SongVC: UIViewController {
    
    @IBOutlet weak var albumCover: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer?
    var finalName = ""
    var finalSinger = ""
    var finalSongClicked = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songNameLabel.text = finalName
        artistNameLabel.text = finalSinger
        imageIdentifier()
        // Do any additional setup after loading the view.
    }
    
    func artistsName() {
        artistNameLabel.text = musicData[0].artistName
    }
    
    func imageIdentifier() {
        if finalName == musicData[0].name {
            albumCover.image = UIImage(named: musicData[0].name)
        } else if finalName == musicData[1].name {
            albumCover.image = UIImage(named: musicData[1].name)
        } else if finalName == musicData[2].name {
            albumCover.image = UIImage(named: musicData[2].name)
        } else if finalName == musicData[3].name {
            albumCover.image = UIImage(named: musicData[3].name)
        } else if finalName == musicData[4].name {
            albumCover.image = UIImage(named: musicData[4].name)
        } else if finalName == musicData[5].name {
            albumCover.image = UIImage(named: musicData[5].name)
        }
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        if finalSongClicked == musicData[0].name {
            let pathToSound = Bundle.main.path(forResource: "Sweater Weather", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } else if finalSongClicked == musicData[1].name {
            let pathToSound = Bundle.main.path(forResource: "Wiped Out!", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } else if finalSongClicked == musicData[2].name {
            let pathToSound = Bundle.main.path(forResource: "R.I.P. 2 My Youth", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } else if finalSongClicked == musicData[3].name {
            let pathToSound = Bundle.main.path(forResource: "The Beach", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } else if finalSongClicked == musicData[4].name {
            let pathToSound = Bundle.main.path(forResource: "Ferrari", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        } else if finalSongClicked == musicData[5].name {
            let pathToSound = Bundle.main.path(forResource: "Wires", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            do{
                audioPlayer = try? AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}

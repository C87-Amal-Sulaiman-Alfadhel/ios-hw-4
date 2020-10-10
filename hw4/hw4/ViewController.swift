//
//  ViewController.swift
//  hw4
//
//  Created by Amal Alfadhel on 10/7/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImg0: UIButton!
    @IBOutlet weak var albumImg1: UIButton!
    @IBOutlet weak var albumImg2: UIButton!
    @IBOutlet weak var albumImg3: UIButton!
    @IBOutlet weak var albumImg4: UIButton!
    @IBOutlet weak var albumImg5: UIButton!
    
    @IBOutlet weak var albumLabel0: UILabel!
    @IBOutlet weak var albumLabel1: UILabel!
    @IBOutlet weak var albumLabel2: UILabel!
    @IBOutlet weak var albumLabel3: UILabel!
    @IBOutlet weak var albumLabel4: UILabel!
    @IBOutlet weak var albumLabel5: UILabel!
    
    var index: Int = 0
    var songName = ""
    var singerName = ""
    var songClicked = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSongImages()
        setSongName()
        // Do any additional setup after loading the view.
    }
    func setSongImages() {
        albumImg0.setBackgroundImage(UIImage(named: musicData[0].name), for: .normal)
        albumImg1.setBackgroundImage(UIImage(named: musicData[1].name), for: .normal)
        albumImg2.setBackgroundImage(UIImage(named: musicData[2].name), for: .normal)
        albumImg3.setBackgroundImage(UIImage(named: musicData[3].name), for: .normal)
        albumImg4.setBackgroundImage(UIImage(named: musicData[4].name), for: .normal)
        albumImg5.setBackgroundImage(UIImage(named: musicData[5].name), for: .normal)
    }
    
    func setSongName() {
        albumLabel0.text = musicData[0].name
        albumLabel1.text = musicData[1].name
        albumLabel2.text = musicData[2].name
        albumLabel3.text = musicData[3].name
        albumLabel4.text = musicData[4].name
        albumLabel5.text = musicData[5].name
        
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        index = sender.tag
    }
    @IBAction func btn2(_ sender: UIButton) {
        index = sender.tag
    }
    @IBAction func btn3(_ sender: UIButton) {
        index = sender.tag
    }
    @IBAction func btn4(_ sender: UIButton) {
        index = sender.tag
    }
    @IBAction func btn5(_ sender: UIButton) {
        index = sender.tag
    }
    @IBAction func btn6(_ sender: UIButton) {
        index = sender.tag
    }
    
    
    @IBAction func goToSong(_ sender: Any) {
        if index == 1 {
            self.songName = musicData[0].name
            self.singerName = musicData[0].artistName
            self.songClicked = musicData[0].name
        } else if index == 2 {
            self.songName = musicData[1].name
            self.singerName = musicData[1].artistName
            self.songClicked = musicData[1].name
        } else if index == 3 {
            self.songName = musicData[2].name
            self.singerName = musicData[2].artistName
            self.songClicked = musicData[2].name
        } else if index == 4 {
            self.songName = musicData[3].name
            self.singerName = musicData[3].artistName
            self.songClicked = musicData[3].name
        } else if index == 5 {
            self.songName = musicData[4].name
            self.singerName = musicData[4].artistName
            self.songClicked = musicData[4].name
        } else if index == 6 {
            self.songName = musicData[5].name
            self.singerName = musicData[5].artistName
            self.songClicked = musicData[5].name
        }
       
        performSegue(withIdentifier: "song", sender: self)
    }

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! SongVC
        vc.finalName = self.songName
        vc.finalSinger = self.singerName
        vc.finalSongClicked = self.songClicked
    }
    
}


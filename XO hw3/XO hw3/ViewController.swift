//
//  ViewController.swift
//  XO hw3
//
//  Created by Amal Alfadhel on 9/29/20.
//  Copyright © 2020 Amal Alfadhel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var playerScoreLabel: UILabel!
    
    @IBOutlet weak var b1: UIImageView!
    @IBOutlet weak var b2: UIImageView!
    @IBOutlet weak var b3: UIImageView!
    @IBOutlet weak var b4: UIImageView!
    @IBOutlet weak var b5: UIImageView!
    @IBOutlet weak var b6: UIImageView!
    @IBOutlet weak var b7: UIImageView!
    @IBOutlet weak var b8: UIImageView!
    @IBOutlet weak var b9: UIImageView!
    
    var lastValue = "o"
    var playerChoices: [Box] = []
    var computerChoices: [Box] = []
    
    
    @IBAction func soundButton(_ sender: UIButton) {
        let selectedInstrument = sender.tag
        
        switch selectedInstrument {
        case 1:
            let pathToSound = Bundle.main.path(forResource: "formula_1", ofType: "mp3")!
            let url = URL(fileURLWithPath: pathToSound)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
//                error handling
            }
        default:
            return 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createTap(on: b1, type: .one)
        createTap(on: b2, type: .two)
        createTap(on: b3, type: .three)
        createTap(on: b4, type: .four)
        createTap(on: b5, type: .five)
        createTap(on: b6, type: .six)
        createTap(on: b7, type: .seven)
        createTap(on: b8, type: .eight)
        createTap(on: b9, type: .nine)
    
        
    }
    

    func createTap(on imageView: UIImageView, type box: Box ) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.boxClicked(_:)))
        tap.name = box.rawValue
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    @objc func boxClicked(_ sender: UITapGestureRecognizer){
        let selectedBox = getBox(from: sender.name ?? "")
        makeChoice(selectedBox)
        playerChoices.append(Box(rawValue: sender.name!)!)
        checkIfWon()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.computerPlay()
        }
    }
    
    func computerPlay() {
        var availableSpaces = [UIImageView]()
        var availableBoxes = [Box]()
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            if box.image == nil {
                availableSpaces.append(box)
                availableBoxes.append(name)
            }
        }
        
        guard availableBoxes.count > 0 else { return }
        
        let randomIndex = Int.random(in: 0 ..< availableSpaces.count)
        makeChoice(availableSpaces[randomIndex])
        computerChoices.append(availableBoxes[randomIndex])
        checkIfWon()
    }
    
    func makeChoice(_ selectedBox: UIImageView) {
        guard selectedBox.image == nil else{ return }
        
        if lastValue == "x" {
            selectedBox.image = #imageLiteral(resourceName: "mercedes")
            lastValue = "o"
        } else {
            selectedBox.image = #imageLiteral(resourceName: "ferrari")
            lastValue = "x"
        }
    }
    
    func checkIfWon() {
        var correct = [[Box]]()
        let firstRow: [Box] = [.one, .two, .three]
        let secondRow: [Box] = [.four, .five, .six]
        let thirdRow: [Box] = [.seven, .eight, .nine]
        
        let firstCol: [Box] = [.one, .four, .seven]
        let secondCol: [Box] = [.two, .five, .eight]
        let thirdCol: [Box] = [.three, .six, .nine]
        
        let firstDiag: [Box] = [.one, .five, .nine]
        let secondDiag: [Box] = [.three, .five, .seven]
        
        correct.append(firstRow)
        correct.append(secondRow)
        correct.append(thirdRow)
        correct.append(firstCol)
        correct.append(firstCol)
        correct.append(firstCol)
        correct.append(firstDiag)
        correct.append(firstDiag)
        
        for valid in correct {
            let userMatch = playerChoices.filter { valid.contains($0)}.count
            let computerMatch = computerChoices.filter { valid.contains($0)}.count
            
            if userMatch == valid.count {
                playerScoreLabel.text = String((Int(playerScoreLabel.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerMatch == valid.count {
                computerScoreLabel.text = String((Int(computerScoreLabel.text ?? "0") ?? 0) + 1)
                resetGame()
                break
            }else if computerChoices.count + playerChoices.count == 9 {
                resetGame()
                break
            }
        }
    }
    
    func resetGame() {
        for name in Box.allCases {
            let box = getBox(from: name.rawValue)
            box.image = nil
        }
        lastValue = "x"
        playerChoices = []
        computerChoices = []
    }
    
    func getBox(from name: String) -> UIImageView {
        let box = Box(rawValue: name) ?? .one
        switch box {
        case .one:
            return b1
        case .two:
            return b2
        case .three:
            return b3
        case .four:
            return b4
        case .five:
            return b5
        case .six:
            return b6
        case .seven:
            return b7
        case .eight:
            return b8
        case .nine:
        return b9
        }
    }

}

enum Box : String, CaseIterable {
    case one, two, three, four, five, six, seven, eight, nine
}


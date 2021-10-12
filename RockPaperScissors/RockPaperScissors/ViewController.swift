//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Diego on 10/7/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var myHand = ""
    let hands = ["👊", "🤚", "✌"]
    let losesAgainst = ["👊": "✌", "🤚": "👊", "✌": "🤚"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func selectRock(_ sender: Any) {
        updateHand(hand: "👊")
    }
    
    @IBAction func selectPaper(_ sender: Any) {
        updateHand(hand: "🤚")
    }
    
    @IBAction func selectScissors(_ sender: Any) {
        updateHand(hand: "✌")
    }
    
    @IBAction func play(_ sender: Any) {
        var counter = 3
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if counter > 0 {
                self.label.text = "You've selected \(self.myHand)\n\(counter)"
            } else {
                timer.invalidate()
                self.finishGame()
            }
            counter -= 1
        }
    }
    
    private func finishGame() {
        let iPhoneHand = hands.randomElement()!
        
        var message = ""
        if iPhoneHand == myHand {
            message = "It's a tie!"
        } else if losesAgainst[iPhoneHand] == myHand {
            message = "iPhone wins!"
        } else {
            message = "You won!"
        }
        label.text = "You've selected \(myHand)\niPhone selected \(iPhoneHand)\n\(message)"    }
    
    private func updateHand(hand: String) {
        myHand = hand
        showSelectedHand()
    }
    
    private func showSelectedHand() {
        label.text = "You've selected \(myHand)"
    }
}


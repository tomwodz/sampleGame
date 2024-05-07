//
//  ViewController.swift
//  sampleGame
//
//  Created by Mini-M1 on 07/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    var count = 0
    var timer = Timer()
    var seconds = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func button(sender: UIButton)
    {
        count+=1
        resultLabel.text = "Wynik \(count)"
    }
    
 
    
    func setupGame(){
        timeLabel.text = "test"
        count = 0
        seconds = 10
        timeLabel.text = "Czas \(seconds)"
        resultLabel.text = "Wynik \(count)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    
    @objc func tick() {
        seconds -= 1
        timeLabel.text = "Czas \(seconds)"
        
        if seconds == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Koniec", message: "Twój wynik \(count)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Graj ponowanie", style: .default, handler: {action in self.setupGame()})
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }

}


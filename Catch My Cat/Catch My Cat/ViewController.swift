//
//  ViewController.swift
//  Catch My Cat
//
//  Created by Yogesh Rathore on 21/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var catImageView1: UIImageView!
    @IBOutlet weak var catImageView2: UIImageView!
    @IBOutlet weak var catImageView3: UIImageView!
    @IBOutlet weak var catImageView4: UIImageView!
    @IBOutlet weak var catImageView5: UIImageView!
    @IBOutlet weak var catImageView6: UIImageView!
    @IBOutlet weak var catImageView7: UIImageView!
    @IBOutlet weak var catImageView8: UIImageView!
    @IBOutlet weak var catImageView9: UIImageView!
    
    var timer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    
    var hideCatTimer = Timer()
    var catImageArray = [UIImageView]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpImageView()
        
        scoreLabel.text = "Score: \(score)"
        
        let highScoreSavedValue = UserDefaults.standard.object(forKey: "highScore")
        
        if highScoreSavedValue == nil {
            highScoreLabel.text = "High Score: \(highScore)"
        }
        
        if let highScoreValue = highScoreSavedValue as? Int {
            highScoreLabel.text = "High Score: \(highScoreValue)"
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCountDown), userInfo: nil, repeats: true)
        counter = 10
        timeLabel.text = String(counter)
        
        hideCatTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideCatTimerCount), userInfo: nil, repeats: true)
    
        
        
    }
    
    @objc func timerCountDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideCatTimer.invalidate()
            
            for cat in catImageArray {
                cat.isHidden = true
            }
            
            if score > highScore {
                highScore = score
                highScoreLabel.text = "High Score: \(self.highScore)"
                UserDefaults.standard.setValue(highScore, forKey: "highScore")
            }
            
            let alert = UIAlertController(title: "Time`s Up", message: "Do you want to play again ?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            let replayButton = UIAlertAction(title: "Replay", style: .default) { alert in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerCountDown), userInfo: nil, repeats: true)
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.hideCatTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideCatTimerCount), userInfo: nil, repeats: true)
                
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true)
        }
        
    }
    
    @objc func hideCatTimerCount() {
        for cat in catImageArray {
            cat.isHidden = true
        }
        
        let randomCat = arc4random_uniform(UInt32(catImageArray.count - 1))
        print("random = \(randomCat)")
        catImageArray[Int(randomCat)].isHidden = false
    }
    
    private func setUpImageView() {
        
        catImageArray = [catImageView1, catImageView2, catImageView3, catImageView4, catImageView5, catImageView6, catImageView7, catImageView8, catImageView9]
        
        // Add Gesture on ImageView
        catImageView1.isUserInteractionEnabled = true
        catImageView2.isUserInteractionEnabled = true
        catImageView3.isUserInteractionEnabled = true
        catImageView4.isUserInteractionEnabled = true
        catImageView5.isUserInteractionEnabled = true
        catImageView6.isUserInteractionEnabled = true
        catImageView7.isUserInteractionEnabled = true
        catImageView8.isUserInteractionEnabled = true
        catImageView9.isUserInteractionEnabled = true
        
        let catGesture1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView1.addGestureRecognizer(catGesture1)
        
        let catGesture2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView2.addGestureRecognizer(catGesture2)
        
        let catGesture3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView3.addGestureRecognizer(catGesture3)
        
        let catGesture4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView4.addGestureRecognizer(catGesture4)
        
        let catGesture5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView5.addGestureRecognizer(catGesture5)
        
        let catGesture6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView6.addGestureRecognizer(catGesture6)
        
        let catGesture7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView7.addGestureRecognizer(catGesture7)
        
        let catGesture8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView8.addGestureRecognizer(catGesture8)
        
        let catGesture9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        catImageView9.addGestureRecognizer(catGesture9)
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
        
    }


}


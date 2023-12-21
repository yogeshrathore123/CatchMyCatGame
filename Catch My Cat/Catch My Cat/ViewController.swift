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
    
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpImageView()
        
        scoreLabel.text = "Score: \(score)"
    
        
        
    }
    
    private func setUpImageView() {
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


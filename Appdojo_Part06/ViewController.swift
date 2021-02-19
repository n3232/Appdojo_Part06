//
//  ViewController.swift
//  Appdojo_Part06
//
//  Created by Kosuke Nagao on 2021/02/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRandomValue()
    }

    @IBAction func judge(_ sender: Any) {
        
        let sliderValue = Int(slider.value)
        let randomValue = Int(label.text!)
        
        // あたり判定
        var result = "はずれ！"
        if sliderValue == randomValue {
            result = "あたり！"
        }
        
        // アラートの表示
        let alert = UIAlertController(title: "結果", message: "\(result)\nあなたの値：\(sliderValue)", preferredStyle: .alert)
        let challengeAgainButton = UIAlertAction(title: "再挑戦", style: .default, handler: {action in self.updateRandomValue()})
        alert.addAction(challengeAgainButton)
        self.present(alert, animated: true, completion: nil)
    }

    func updateRandomValue() {
        let value = arc4random_uniform(99) + 1
        label.text = String(value)
    }
    
}


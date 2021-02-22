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
    private var answer: Int = ViewController.makeAnswer()

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(answer)
    }

    @IBAction private func judge(_ sender: Any) {
        let sliderValue = Int(slider.value)
        let randomValue = Int(label.text!)

        // あたり判定
        let result: String
        if sliderValue == randomValue {
            result = "あたり！"
        } else {
            result = "はずれ！"
        }

        // アラートの表示
        let alert = UIAlertController(
            title: "結果",
            message: "\(result)\nあなたの値：\(sliderValue)",
            preferredStyle: .alert)
        let challengeAgainButton = UIAlertAction(
            title: "再挑戦",
            style: .default,
            handler: {[weak self] _ in self?.updateAnswer()})
        alert.addAction(challengeAgainButton)
        present(alert, animated: true, completion: nil)
    }

    private func updateAnswer() {
        answer = ViewController.makeAnswer()
        label.text = String(answer)
    }

    private static func makeAnswer() -> Int {
        return Int.random(in: 1...100)
    }
}

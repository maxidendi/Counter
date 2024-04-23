//
//  ViewController.swift
//  Counter
//
//  Created by Денис Максимов on 21.04.2024.
//

import UIKit



final class ViewController: UIViewController {
    
    @IBOutlet weak var valueOfCounter: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!

    @IBOutlet weak var counterLog: UITextView!
    
    private var date = Date().formatted()
    private var amountOfCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPlus.layer.cornerRadius = 15
        buttonMinus.layer.cornerRadius = 15
        buttonReset.layer.cornerRadius = 15
        counterLog.text += "История изменений:\n"
        counterLog.isEditable = false
    }
    
    func scrollToBottom(textView: UITextView) {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
    
    @IBAction func pressPlus(_ sender: Any) {
        amountOfCounter += 1
        valueOfCounter.text = "Значение счетчика: \(amountOfCounter)"
        counterLog.text += "\(date): значение изменено на +1\n"
        scrollToBottom(textView: counterLog)
    }
    @IBAction func pressMinus(_ sender: Any) {
        if amountOfCounter != 0 {
            amountOfCounter -= 1
            valueOfCounter.text = "Значение счетчика: \(amountOfCounter)"
            counterLog.text += "\(date): значение изменено на -1\n"
            scrollToBottom(textView: counterLog)
        } else {
            counterLog.text += "\(date): попытка уменьшить значение счетчика ниже 0\n"
            scrollToBottom(textView: counterLog)
            }
    }
    @IBAction func resetTheCounter(_ sender: Any) {
        amountOfCounter = 0
        valueOfCounter.text = "Значение счетчика: 0"
        counterLog.text += "\(date): значение сброшено\n"
        scrollToBottom(textView: counterLog)
    }
}


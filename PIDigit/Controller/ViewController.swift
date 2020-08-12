//
//  ViewController.swift
//  PIDigit
//
//  Created by Mateusz Uszyński on 06/08/2020.
//  Copyright © 2020 Mateusz Uszyński. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputNumber: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.inputNumber.delegate = self
        
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.minimumScaleFactor = 0.3
        resultLabel.lineBreakMode = .byWordWrapping
        resultLabel.numberOfLines = 3
        // Do any additional setup after loading the view.
    }

    @IBAction func calculate(_ sender: UIButton) {
        let pi = String(Double.pi)
        var stringResult: String
        
        if let text = inputNumber.text, text.isEmpty == false {
           // TextField is not empty here
            
            stringResult = String(pi.prefix(Int(text)!+2))
            resultLabel.text = stringResult
        } else {
           // TextField is Empty
            
            resultLabel.text = "Text field is empty!"
        }
    }
    
    //MARK: UITextField Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return allowedCharacters.isSuperset(of: characterSet)
    }
}


//
//  ViewController.swift
//  HW5 - Pickers
//
//  Created by Влад Бокин on 08.08.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signButton.layer.cornerRadius = 9
    }
    @IBAction func signButtonAction(_ sender: Any) {
        if emailTextField.text == "" || passwordTextField.text == "" {
            errorAlert(title: "Ошибка", message: "Введите данные", style: .alert)
        } else {
            self.performSegue(withIdentifier: "showFirstVC", sender: nil)
        }
    }
    
    func errorAlert(title: String, message: String, style: UIAlertController.Style){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
        
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }

}


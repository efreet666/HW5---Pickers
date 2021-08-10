//
//  FirstViewController.swift
//  HW5 - Pickers
//
//  Created by Влад Бокин on 09.08.2021.
//

import UIKit

protocol newItemDelegate{
    func createNewItem(name: String, date: String, age: String, gender: String, instagram: String)
}
class FirstViewController: UIViewController {

    var birthdays = [Model]()
    
    @IBAction func createNewPersonButton(_ sender: Any) {
        let storyB = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController =
         storyB.instantiateViewController(withIdentifier:
         "SecondViewController") as! SecondViewController
        secondViewController.delegate = self
         self.present(secondViewController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if birthdays.count != 0{
            addBirthdayView()
        }
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func addBirthdayView(){
        var i = 0
    let view = UIView()
    view.frame = CGRect(x: 0, y: 90, width: self.view.frame.width, height: 120)
    view.backgroundColor = UIColor.red
    self.view.addSubview(view)
        
    let nameLabel = UILabel()
    nameLabel.frame = CGRect(x: 0, y: 5, width: 40, height: 10)
        nameLabel.text = ""
        self.view.addSubview(nameLabel)
        i += 1
    }
}
extension FirstViewController: newItemDelegate{
     func createNewItem(name: String, date: String, age: String, gender: String, instagram: String) {
        
       birthdays.append(Model.init(personName: name, personDate: date, personAge: age, personGender: gender, inst: instagram))
        
    }
}

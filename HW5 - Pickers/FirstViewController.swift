//
//  FirstViewController.swift
//  HW5 - Pickers
//
//  Created by Влад Бокин on 09.08.2021.
//

import UIKit

protocol newItemDelegate{
    func createNewItem(name: String, date: String, age: String, gender: String, instagram: String)
    func formatedDate(date: String, formatedDate: String)
}
class FirstViewController: UIViewController {

    var birthdays = [Model]()
    var formatedBirthday: String = ""
    var formatedDate: String =  ""

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
        
       
    }
    func update(){
        print(birthdays.count)
    if birthdays.count != 0{
        addBirthdayView(birthday: birthdays)
    }
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    var i = 0
    func addBirthdayView(birthday: [Model]){

    let cellView = UIView()
        cellView.frame = CGRect(x: 20, y: 90 + (110 * birthdays.count), width: Int(self.view.frame.width) - 40, height: 1)
    cellView.backgroundColor = UIColor.lightGray
    self.view.addSubview(cellView)
        
 
    let nameLabel = UILabel()
    nameLabel.frame = CGRect(x: 110, y: 100 * birthdays.count, width: 150, height: 50)
        nameLabel.text = birthdays[i].name
        nameLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        self.view.addSubview(nameLabel)
        
        let formated3 = DateFormatter()
        formated3.dateFormat = "d MMMM yyyy"
        formated3.locale = Locale(identifier: "ru_US_POSIX") // set locale to reliable US_POSIX
        let correctDate = "\(formatedDate) 2021"
        guard let date = formated3.date(from: correctDate) else { return }
        
//        let formated4 = DateFormatter()
//        formated4.dateFormat = "d MMMM EEEE"
//        formated4.locale = Locale(identifier: "ru_US_POSIX")
//        let dateWithDays = formated4.date(from: correctDate)
//
        //days before next birthday
        let currentDate = NSDate()
        let diffInDays = Calendar.current.dateComponents([.day], from: currentDate as Date , to: date).day
        
    let dateLabel = UILabel()
        dateLabel.frame = CGRect(x: 110, y: 120 * birthdays.count, width: 300, height: 70)
        dateLabel.text = "\(formatedDate), исполниться \(Int(birthday[i].age)! + 1) год"
        dateLabel.textColor = UIColor.lightGray
        dateLabel.font = UIFont(name:"HelveticaNeue", size: 14.0)
            self.view.addSubview(dateLabel)
        
        let dayBeforelabel = UILabel()
        dayBeforelabel.textColor = UIColor.lightGray
        dayBeforelabel.font = UIFont(name:"HelveticaNeue", size: 20.0)
        dayBeforelabel.frame = CGRect(x: Int(self.view.frame.width) - 100, y: 100 * birthdays.count, width: 150, height: 50)
        dayBeforelabel.text = "\(String(describing: diffInDays!)) дня"
        self.view.addSubview(dayBeforelabel)

        let personImage = UIImageView()
        personImage.frame = CGRect(x: 10, y: 105 * birthdays.count, width: 90, height: 90)
        personImage.image = #imageLiteral(resourceName: "157-1579943_no-profile-picture-round")
        self.view.addSubview(personImage)
        
        
        i += 1
    }
}
extension FirstViewController: newItemDelegate{
     func createNewItem(name: String, date: String, age: String, gender: String, instagram: String) {
        
       birthdays.append(Model.init(personName: name, personDate: date, personAge: age, personGender: gender, inst: instagram))
        update()
    }
    
    func formatedDate(date: String, formatedDate: String) {
        formatedBirthday = date
        self.formatedDate = formatedDate
    }
}

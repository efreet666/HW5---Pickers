//
//  SecondViewController.swift
//  HW5 - Pickers
//
//  Created by Влад Бокин on 09.08.2021.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var gendersTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var instagramTextField: UITextField!
    
    var delegate: newItemDelegate! = nil
    
    let datePicker = UIDatePicker()
    let agePicker = UIPickerView()
    let genderPicker = UIPickerView()
    
    let genders = ["Женщина", "Мужчина"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        
        let toolbar2 = UIToolbar()
        toolbar2.sizeToFit()
        let doneButton2 = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction2))
        let flexSpace2 = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar2.setItems([flexSpace2, doneButton2], animated: true)
        
        //datapicker
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "Russia")
        datePicker.preferredDatePickerStyle = .wheels
        dateTextField.inputAccessoryView = toolbar
        
        //pickerview
        agePicker.tag = 1
        genderPicker.tag = 2
        
        ageTextField.inputView = agePicker
        agePicker.dataSource = self
        agePicker.delegate = self
        ageTextField.inputAccessoryView = toolbar2
        
        gendersTextField.inputView = genderPicker
        genderPicker.dataSource = self
        genderPicker.delegate = self
        gendersTextField.inputAccessoryView = toolbar2
       
    }
    //Datepicker
    @objc func doneAction(){
        getDataFromPicker()
        view.endEditing(true)
    }
    func getDataFromPicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
        
        let formated2 = DateFormatter()
        formated2.dateFormat = "d MMMM, EEEE"
        let formatedDate = formated2.string(from: datePicker.date)
        delegate.formatedDate(date: formatedDate, formatedDate: datePicker.date)
    }
    //pickerView
    @objc func doneAction2(){
        view.endEditing(true)
    }
 
    
    
    @IBAction func addButton(_ sender: Any) {
        addAlert(title: "Сохранить", message: "Добавить нового пользователя?", style: .actionSheet)
    }
    @IBAction func returnButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    
    //MARK: - Save data
    func addAlert(title: String, message: String, style: UIAlertController.Style){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            let cancel = UIAlertAction(title: "Отмена", style: .default)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
                
                if self.nameTextField.text == "" || self.dateTextField.text == "" || self.ageTextField.text == "" || self.gendersTextField.text == "" ||
                    self.instagramTextField.text == "" {
                    self.errorAlert(title: "Ошибка", message: "Введены не корректные данные", style: .alert)
                } else {
                    
                    //save func
                    self.delegate?.createNewItem(name: self.nameTextField.text!, date: self.dateTextField.text!, age: self.ageTextField.text!, gender: self.gendersTextField.text!, instagram: self.instagramTextField.text!)

                    self.dismiss(animated: true, completion: nil)
                }
                
                
                
            }
            alertController.addAction(action)
            alertController.addAction(cancel)
            self.present(alertController, animated: true, completion: nil)
        }
    
//error
    func errorAlert(title: String, message: String, style: UIAlertController.Style){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
        
            }
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
}

extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 110
        case 2:
            return genders.count
        default:
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(row + 1)"
        case 2:
            return genders[row]
        default:
            return nil
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            ageTextField.text = "\(row + 1)"
        case 2:
            gendersTextField.text = genders[row]
        default:
            return
        }
        
    }
}



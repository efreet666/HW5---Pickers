//
//  Model.swift
//  HW5 - Pickers
//
//  Created by Влад Бокин on 10.08.2021.
//

import Foundation

class Model{
    let name: String
    let date: String
    let age: String
    let gender: String
    let instargram: String
    
    init(personName name: String, personDate date: String, personAge age: String, personGender gender: String, inst instagram: String) {
        self.name = name
        self.age = age
        self.date = date
        self.gender = gender
        self.instargram = instagram
    }
}

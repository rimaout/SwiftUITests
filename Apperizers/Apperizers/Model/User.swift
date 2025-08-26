//
//  User.swift
//  Apperizers
//
//  Created by Matteo on 25/08/25.
//

import Foundation

struct User: Codable {
    var firstName           = ""
    var lastName            = ""
    var email               = ""
    var birthdate           = Date()
    var lactoseIntolerance  = false
    var celiac              = false
}

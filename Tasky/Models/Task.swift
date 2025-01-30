//
//  Task.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}

 

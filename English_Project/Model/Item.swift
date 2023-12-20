//
//  Item.swift
//  English_Project
//
//  Created by Leonardo Mesquita Alves on 17/12/23.
//

import SwiftUI
import SwiftData

@Model
class Item {
    
    var times: Int
    var name: String
    var descrip: String
    var origin: String
    var image: Data?
    var date: Date
    var resource: String?
    
    init(times: Int, name: String, descrip: String , origin: String, image: Data? = nil, date: Date = .now, resource: String = "") {
        self.times = times
        self.name = name
        self.descrip = descrip
        self.origin = origin
        self.image = image
        self.date = date
        self.resource = resource
    }
    
}

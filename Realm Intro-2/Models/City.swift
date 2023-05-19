//
//  City.swift
//  Realm Intro-2
//
//  Created by Marcin Jędrzejak on 19/05/2023.
//

import Foundation
import RealmSwift

class City: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var cities: List<City>
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

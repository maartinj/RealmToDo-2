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
    @Persisted(originProperty: "cities") var country: LinkingObjects<Country>
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

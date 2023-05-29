//
//  Migrator.swift
//  Realm Intro-2
//
//  Created by Marcin Jędrzejak on 29/05/2023.
//

import Foundation
import RealmSwift

class Migrator {
    init() {
        updateSchema()
    }
    
    func updateSchema() {
        let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: Country.className()) { _, newObject in
                    newObject!["flag"] = "🏳️"
                }
            }
        }
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}

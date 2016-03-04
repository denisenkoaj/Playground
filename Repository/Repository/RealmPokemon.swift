//
//  RealmPokemon.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import RealmSwift

class RealmPokemon: Object {
    dynamic var ID: Int = 0
    dynamic var name: String = ""
    
    var pokemon: Pokemon {
        return Pokemon(ID: UInt(ID), name: name)
    }
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
    func update(ID ID: Int, name: String) -> RealmPokemon {
        self.ID = ID
        self.name = name
        return self
    }
}

//
//  NSPokemon.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation

class NSPokemon: NSObject {
    let ID: UInt
    let name: String
    
    var pokemon: Pokemon {
        return Pokemon(ID: ID, name: name)
    }
    
    init(ID: UInt, name: String) {
        self.ID = ID
        self.name = name
    }
}

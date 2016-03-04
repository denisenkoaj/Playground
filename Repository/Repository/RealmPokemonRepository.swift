//
//  RealmPokemonRepository.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import SwiftTask
import RealmSwift
import AnyQuery

class RealmPokemonRepository: Repository {
    typealias Domain = Pokemon
    
    static func setup() {
        let realmPokemons = [
            RealmPokemon().update(ID: 1, name: "Bulbasaur"),
            RealmPokemon().update(ID: 2, name: "Ivysaur"),
            RealmPokemon().update(ID: 3, name: "Venusaur"),
            RealmPokemon().update(ID: 4, name: "Charmander"),
            RealmPokemon().update(ID: 5, name: "Charmeleon"),
            RealmPokemon().update(ID: 6, name: "Charizard"),
            RealmPokemon().update(ID: 7, name: "Squirtle"),
            RealmPokemon().update(ID: 8, name: "Wartortle"),
            RealmPokemon().update(ID: 9, name: "Blastoise")
        ]
        
        let realm = try! Realm()
        try! realm.write {
            for realmPokemon in realmPokemons {
                realm.add(realmPokemon, update: true)
            }
        }
    }
    
    func find(ID: UInt) -> Task<Float, Pokemon, ErrorType> {
        return Task<Float, Pokemon, ErrorType> { fulfill, reject in
            let realm = try! Realm()
            if let pokemon = realm.objects(RealmPokemon).filter("ID == %d", ID).first {
                fulfill(pokemon.pokemon)
            } else {
                reject(RepositoryError.NotFound)
            }
        }
    }
    
    func findAll(query query: AnyQuery?, sort: AnySort?) -> Task<Float, [Pokemon], ErrorType> {
        return Task<Float, [Pokemon], ErrorType> { fulfill, reject in
            let realm = try! Realm()
            var result = realm.objects(RealmPokemon)
            
            if let predicate = query?.predicate {
                result = result.filter(predicate)
            }
            
            if let sortDescriptors = sort?.sortDescriptors {
                for sortDescriptor in sortDescriptors {
                    guard let key = sortDescriptor.key else {
                        continue
                    }
                    result = result.sorted(key, ascending: sortDescriptor.ascending)
                }
            }
            
            if result.isEmpty {
                reject(RepositoryError.NotFound)
            } else {
                let pokemons = result.map { $0.pokemon }
                fulfill(pokemons)
            }
        }
    }
}

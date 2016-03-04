//
//  MemoryPokemonRepository.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import Foundation
import SwiftTask
import AnyQuery

class MemoryPokemonRepository: Repository {
    typealias Domain = Pokemon
    
    private let pokemons = [
        NSPokemon(ID: 1, name: "Bulbasaur"),
        NSPokemon(ID: 2, name: "Ivysaur"),
        NSPokemon(ID: 3, name: "Venusaur"),
        NSPokemon(ID: 4, name: "Charmander"),
        NSPokemon(ID: 5, name: "Charmeleon"),
        NSPokemon(ID: 6, name: "Charizard"),
        NSPokemon(ID: 7, name: "Squirtle"),
        NSPokemon(ID: 8, name: "Wartortle"),
        NSPokemon(ID: 9, name: "Blastoise")
    ]
    
    func find(ID: UInt) -> Task<Float, Pokemon, ErrorType> {
        if let pokemon = pokemons.filter({ $0.ID == ID }).first {
            return Task(value: pokemon.pokemon)
        } else {
            return Task(error: RepositoryError.NotFound)
        }
    }
    
    func findAll(query query: AnyQuery?, sort: AnySort?) -> Task<Float, [Pokemon], ErrorType> {
        var found = pokemons
        
        if let predicate = query?.predicate {
            found = pokemons.filter { predicate.evaluateWithObject($0) }
        }
        
        if let sortDescriptors = sort?.sortDescriptors {
            let sorted = NSArray(array: found).sortedArrayUsingDescriptors(sortDescriptors)
            found = sorted as! [NSPokemon]
        }
        
        let result = found.map { $0.pokemon }
        return result.isEmpty ? Task(error: RepositoryError.NotFound) : Task(value: result)
    }
}

//
//  Repository.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import SwiftTask
import AnyQuery

protocol Repository {
    typealias Domain
    
    func find(ID: UInt) -> Task<Float, Domain, ErrorType>
    func findAll() -> Task<Float, [Domain], ErrorType>
    func findAll(query query: AnyQuery?, sort: AnySort?) -> Task<Float, [Domain], ErrorType>
    func save(domains: [Domain])
    func delete(domains: [Domain])
}

extension Repository {
    func find(ID: UInt) -> Task<Float, Domain, ErrorType> {
        fatalError("Not implemented")
    }
    
    func findAll() -> Task<Float, [Domain], ErrorType> {
        return findAll(query: .None, sort: .None)
    }
    
    func findAll(query query: AnyQuery?, sort: AnySort?) -> Task<Float, [Domain], ErrorType> {
        fatalError("Not implemented")
    }
    
    func save(domains: [Domain]) {
        fatalError("Not implemented")
    }
    
    func delete(domains: [Domain]) {
        fatalError("Not implemented")
    }
}

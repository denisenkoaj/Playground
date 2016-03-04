//
//  AnyRepository.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import SwiftTask
import AnyQuery

struct AnyRepository<DomainType>: Repository {
    typealias Domain = DomainType
    
    private let _find: UInt -> Task<Float, DomainType, ErrorType>
    private let _findAll: (AnyQuery?, AnySort?) -> Task<Float, [DomainType], ErrorType>
    private let _save: [Domain] -> Void
    private let _delete: [Domain] -> Void
    
    init<T: Repository where T.Domain == DomainType>(_ repository: T) {
        self._find = repository.find
        self._findAll = { query, sort in repository.findAll(query: query, sort: sort) }
        self._save = repository.save
        self._delete = repository.delete
    }
    
    func find(ID: UInt) -> Task<Float, Domain, ErrorType> {
        return _find(ID)
    }
    
    func findAll(query query: AnyQuery?, sort: AnySort?) -> Task<Float, [Domain], ErrorType> {
        return _findAll(query, sort)
    }
    
    func save(domains: [Domain]) {
        return _save(domains)
    }
    
    func delete(domains: [Domain]) {
        return _delete(domains)
    }
}

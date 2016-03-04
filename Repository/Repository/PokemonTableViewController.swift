//
//  PokemonTableViewController.swift
//  Repository
//
//  Created by Naoto Kaneko on 3/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit
import AnyQuery

class PokemonTableViewController: UITableViewController {
    var pokemons: [Pokemon] = []
    lazy var repository: AnyRepository<Pokemon> = AnyRepository(RealmPokemonRepository())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = AnyQuery.Equal(key: "ID", value: 1) || AnyQuery.Equal(key: "ID", value: 2)
        let sort = AnySort.Ascending(key: "name")
        repository.findAll(query: query, sort: sort).success { [unowned self] pokemons in
            self.pokemons = pokemons
            self.tableView.reloadData()
        }.failure { error, _ in
            print("Not found")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let pokemon = pokemons[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonTableViewCell", forIndexPath: indexPath)
        cell.textLabel?.text = pokemon.name
        return cell
    }
}

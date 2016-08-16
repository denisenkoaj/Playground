//
//  PokedexViewController.swift
//  AdaptiveTableHeaderView
//
//  Created by Naoto Kaneko on 8/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class PokedexViewController: UITableViewController {
    private let pokemons: [Pokemon] = [
        Pokemon(name: "Bulbasaur"),
        Pokemon(name: "Ivysaur"),
        Pokemon(name: "Venusaur"),
        Pokemon(name: "Charmander"),
        Pokemon(name: "Charmeleon"),
        Pokemon(name: "Charizard"),
        Pokemon(name: "Squirtle"),
        Pokemon(name: "Wartortle"),
        Pokemon(name: "Blastoise"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PokemonTableViewCell", forIndexPath: indexPath)

        cell.textLabel?.text = pokemons[indexPath.row].name

        return cell
    }
}

//
//  PokemonTableViewController.swift
//  StateContainerViewController
//
//  Created by Naoto Kaneko on 4/4/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    private var pokemons: [Pokemon] = [
        Pokemon(id: 1, name: "Bulbasaur"),
        Pokemon(id: 2, name: "Ivysaur"),
        Pokemon(id: 3, name: "Venusaur"),
        Pokemon(id: 4, name: "Charmander"),
        Pokemon(id: 5, name: "Charmeleon"),
        Pokemon(id: 6, name: "Charizard"),
        Pokemon(id: 7, name: "Squirtle"),
        Pokemon(id: 8, name: "Wartortle"),
        Pokemon(id: 9, name: "Blastoise"),
    ]

    private let cellIdentifier = "PokemonTableViewCell"

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
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        let pokemon = pokemons[indexPath.row]
        cell.textLabel?.text = pokemon.name

        return cell
    }
}

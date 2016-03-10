//
//  PokemonTableViewController.swift
//  ResultContainer
//
//  Created by Naoto Kaneko on 3/10/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class PokemonTableViewController: UITableViewController {
    let pokemons: [Pokemon] = [
        Pokemon(ID: 1, name: "Bulbasaur"),
        Pokemon(ID: 2, name: "Ivysaur"),
        Pokemon(ID: 3, name: "Venusaur"),
        Pokemon(ID: 4, name: "Charmander"),
        Pokemon(ID: 5, name: "Charmeleon"),
        Pokemon(ID: 6, name: "Charizard"),
        Pokemon(ID: 7, name: "Squirtle"),
        Pokemon(ID: 8, name: "Wartortle"),
        Pokemon(ID: 9, name: "Blastoise")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parentViewController?.title = NSLocalizedString("PokemonTableView.Title", comment: "")
        
        let refreshButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "refreshTableView")
        parentViewController?.navigationItem.rightBarButtonItem = refreshButtonItem
    }
    
    func refreshTableView() {
        if let containerViewController = parentViewController as? ResultContainerViewControllerType {
            containerViewController.transitionToFailureContent()
        }
    }
}

// MARK: - UITableViewDataSource
extension PokemonTableViewController {
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

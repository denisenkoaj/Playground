//
//  CollectionViewController.swift
//  Gallery
//
//  Created by Naoto Kaneko on 6/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    static let reuseIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewController.reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }
}

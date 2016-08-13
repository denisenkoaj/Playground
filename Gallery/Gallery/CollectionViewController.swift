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
        return 3
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CollectionViewController.reuseIdentifier, forIndexPath: indexPath)
        cell.backgroundColor = UIColor.blueColor()
        return cell
    }

    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "CollectionHeader", forIndexPath: indexPath)
        return view
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    private var numberOfColumns: Int {
        return 2
    }

    private var minimumLineSpacing: CGFloat {
        return 1
    }

    private var minimumInteritemSpacing: CGFloat {
        return 1
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let length = (collectionView.frame.width - minimumInteritemSpacing * CGFloat(numberOfColumns - 1)) / CGFloat(numberOfColumns)

        if indexPath.row == 0 {
            return CGSize(width: collectionView.frame.width, height: length)
        } else {
            return CGSize(width: length, height: length)
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return minimumLineSpacing
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return minimumInteritemSpacing
    }
}

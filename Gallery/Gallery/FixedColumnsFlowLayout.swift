//
//  FixedColumnsFlowLayout.swift
//  Gallery
//
//  Created by Naoto Kaneko on 6/16/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class FixedColumnsFlowLayout: UICollectionViewFlowLayout {
    @IBInspectable var numberOfColumns: Int = 1 {
        didSet {
            numberOfColumns = max(numberOfColumns, 1)
        }
    }

    override var itemSize: CGSize {
        set {
        }
        get {
            let width = (collectionView!.frame.width - minimumInteritemSpacing * CGFloat(numberOfColumns - 1)) / CGFloat(numberOfColumns)
            return CGSize(width: width, height: width)
        }
    }
}

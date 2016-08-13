//
//  UICollectionViewFlowLayout+Pinning.swift
//  Gallery
//
//  Created by Naoto Kaneko on 6/17/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

extension UICollectionViewFlowLayout {
    @IBInspectable var isPinningHeader: Bool {
        get {
            return sectionHeadersPinToVisibleBounds
        }
        set {
            sectionHeadersPinToVisibleBounds = newValue
        }
    }

    @IBInspectable var isPinningFooter: Bool {
        get {
            return sectionFootersPinToVisibleBounds
        }
        set {
            sectionFootersPinToVisibleBounds = newValue
        }
    }
}

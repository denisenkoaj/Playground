//
//  EmptyViewController.swift
//  ResultContainer
//
//  Created by Naoto Kaneko on 3/10/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var recoveryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = NSLocalizedString("EmptyView.Title", comment: "")
        descriptionLabel.text = NSLocalizedString("EmptyView.Description", comment: "")
        recoveryButton.setTitle(NSLocalizedString("EmptyView.RecoveryButtonTitle", comment: ""), forState: .Normal)
    }
}

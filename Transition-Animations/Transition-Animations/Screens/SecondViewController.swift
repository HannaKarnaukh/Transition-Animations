//
//  SecondViewController.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 02.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private weak var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .green
        navigationItem.title = "Collection"
    }
}

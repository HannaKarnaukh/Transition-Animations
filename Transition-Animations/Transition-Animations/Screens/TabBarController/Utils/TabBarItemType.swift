//
//  TabBarItemType.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 02.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import UIKit

enum TabBarItemType: CaseIterable {
    case first
    case second
    
    var item: UITabBarItem {
        switch self {
        case .first:
            return UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        case .second:
            return UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        }
    }
}

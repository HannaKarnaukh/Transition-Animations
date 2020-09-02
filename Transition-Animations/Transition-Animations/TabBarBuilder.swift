//
//  TabBarBuilder.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 02.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import UIKit

class TabBarBuilder {
    
    static func makeTabBar() -> UITabBarController {
        let viewController = TabBarController()
        viewController.viewControllers = TabBarItemType.allCases.map { makeTab(type: $0)}
        return viewController
    }
    
    private static func makeTab(type: TabBarItemType) -> UIViewController {
        switch type {
        case .first:
            let vc = FirstViewController()
            vc.tabBarItem = type.item
            return vc
        case .second:
            let vc = SecondViewController()
            vc.tabBarItem = type.item
            let navVC = UINavigationController(rootViewController: vc)
            return navVC
        }
    }
}


//
//  ViewController.swift
//  3-1
//
//  Created by sogih on 03/06/2019.
//  Copyright © 2019 sogih. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

}



//MARK:- Life Cycle
extension TabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstVC = FirstViewController()
        firstVC.tabBarItem.title = "첫번째"
        firstVC.tabBarItem.image = UIImage(named: "icon_1")
        
        let secondVC = SecondViewController()
        secondVC.tabBarItem.title = "두번째"
        secondVC.tabBarItem.image = UIImage(named: "icon_2")
        
        let thirdVC = ThirdViewController()
        thirdVC.tabBarItem.title = "세번째"
        thirdVC.tabBarItem.image = UIImage(named: "icon_3")
        
        let fourthVC = UINavigationController(rootViewController: FourthViewController())
        fourthVC.tabBarItem.title = "네번째"
        fourthVC.tabBarItem.image = UIImage(named: "icon_1")
        
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}

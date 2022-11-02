//
//  TabBarController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/11/02.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.backgroundColor = UIColor.white
        
        let firstNC = UINavigationController.init(rootViewController: LoLChampionViewController())
        let secondNC = UINavigationController.init(rootViewController: DetailViewController())
        let thirdNC = UINavigationController.init(rootViewController: NewsViewController())
        
        self.viewControllers = [firstNC,secondNC,thirdNC]
        
        let firstTabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "house"), tag: 0)
        let secondTabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "book"), tag: 1)
        let thirtdTabBarItem = UITabBarItem(title: "세번째", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        firstNC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdNC.tabBarItem = thirtdTabBarItem
        // Do any additional setup after loading the view.
    }
}

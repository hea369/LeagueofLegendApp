//
//  CustomTabBarViewController.swift
//  LeagueofLegendApp
//
//  Created by 박호현 on 2022/10/29.
//

import UIKit

class CustomTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .red
        self.tabBar.unselectedItemTintColor = .blue
        

        let firstVC = UINavigationController(rootViewController: LoLChampionViewController())
        firstVC.tabBarItem.image = UIImage(systemName: "house")
        firstVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        firstVC.tabBarItem.title = "챔피언"
        
        let secondVC = UINavigationController(rootViewController: NewsViewController())
        secondVC.tabBarItem.image = UIImage(systemName: "book")
        secondVC.tabBarItem.selectedImage = UIImage(systemName: "book.fill")
        secondVC.tabBarItem.title = "뉴스"
        
        let third = UINavigationController(rootViewController: SerchViewController())
        third.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        third.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.fill")
        third.tabBarItem.title = "전적검색"
        
        viewControllers = [firstVC, secondVC, third]
    }

}

//
//  TabBarController.swift
//  RickAndMortyVIPER
//
//  Created by samet on 20.03.2025.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createTabBar()
      
    }
    
    func createTabBar() {
        let first = UINavigationController(rootViewController: CharacterViewController())
        let second = UINavigationController(rootViewController: LocationViewController())
        let third = UINavigationController(rootViewController: EpisodeViewController())
        
        first.tabBarItem = UITabBarItem(title: "Character", image: UIImage(systemName: "person"), selectedImage: nil)
        second.tabBarItem = UITabBarItem(title: "Location", image: UIImage(systemName: "location"), selectedImage: nil)
        third.tabBarItem = UITabBarItem(title: "Episode", image: UIImage(systemName: "tv"), selectedImage: nil)
        

        tabBar.tintColor = .label
        setViewControllers([first,second,third], animated: true)
    }
    
}

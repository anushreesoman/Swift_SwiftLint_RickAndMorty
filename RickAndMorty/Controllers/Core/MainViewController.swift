//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/19/23.
//

import UIKit

/// Controller to show root view and tabs
final class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabNavigation()
    }
    
    private func setUpTabNavigation() {
        let charactersVC = CharactersViewController()
        let locationsVC = LocationsViewController()
        let episodesVC = EpisodesViewController()
        
        charactersVC.navigationItem.largeTitleDisplayMode = .automatic
        locationsVC.navigationItem.largeTitleDisplayMode = .automatic
        episodesVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let charactersNav = UINavigationController(rootViewController: charactersVC)
        let locationsNav = UINavigationController(rootViewController: locationsVC)
        let episodesNav = UINavigationController(rootViewController: episodesVC)
        
        charactersNav.tabBarItem = UITabBarItem(title: "characters",
                                              image: UIImage(systemName: "person.crop.artframe"),
                                              tag: 1)
        locationsNav.tabBarItem = UITabBarItem(title: "locations",
                                              image: UIImage(systemName: "globe.desk.fill"),
                                              tag: 2)
        episodesNav.tabBarItem = UITabBarItem(title: "episodes",
                                              image: UIImage(systemName: "tv"),
                                              tag: 3)
        
        for navItem in [charactersNav, locationsNav, episodesNav] {
            navItem.navigationBar.prefersLargeTitles = true
        }
        
        setViewControllers([charactersNav, locationsNav, episodesNav],
                           animated: true)
    }

}

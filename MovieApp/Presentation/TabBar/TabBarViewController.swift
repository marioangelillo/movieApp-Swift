//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 16/01/2022.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabBar()
    }
    
    func setTabBar() {
        
        let popularMoviesVC = UINavigationController(rootViewController: MoviesListViewController(nibName: "MoviesListViewController", bundle: nil))
        popularMoviesVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "list.dash"), selectedImage: nil)
        
        let favoritesMoviesVC = UINavigationController(rootViewController: FavoriteMoviesViewController(nibName: "FavoriteMoviesViewController", bundle: nil))
        favoritesMoviesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "suit.heart.fill"), selectedImage: nil)
        
        let managerAccountVC = UINavigationController(rootViewController: AccountViewController(nibName: "AccountViewController", bundle: nil))
        managerAccountVC.tabBarItem = UITabBarItem(title: "Account", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        
        viewControllers = [popularMoviesVC, favoritesMoviesVC, managerAccountVC]
    }
}
        

//
//  MainTabBarController.swift
//  RickAndMorty
//
//  Created by Iskhak Zhutanov on 08.06.23.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .label
        addVCs()
    }
    
    
    func addVCs() {
        viewControllers = [setupVCs(viewController: CharacterModuleBuilder().build(), image: UIImage(systemName: "person.fill")!, title: "Characters"),
                           setupVCs(viewController: LocationModuleBuilder().build(), image: UIImage(systemName: "mappin.and.ellipse")!, title: "Locations"),
                           setupVCs(viewController: EpisodeModuleBuilder().build(), image: UIImage(systemName: "film.stack")!, title: "Episodes")]
    }
    
    func setupVCs(viewController: UIViewController, image: UIImage, title: String) -> UIViewController {
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        return viewController
    }
}

//
//  MainTabController.swift
//  NotInstagram
//
//  Created by Mostafa Alaa on 21/11/2021.
//

import UIKit


class MainTabController:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
        self.view.backgroundColor = UIColor.white

    }
    
    
    func configureViewControllers(){
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, rootController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: UIImage(systemName: "magnifyingglass.circle")!, selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")!, rootController: SearchController())


        let imageSelector = templateNavigationController(unselectedImage: UIImage(systemName: "plus.app")!, selectedImage: UIImage(systemName: "plus.app.fill")!, rootController: ImageSelectorController())


        let notifications = templateNavigationController(unselectedImage: UIImage(systemName: "exclamationmark.bubble")!, selectedImage: UIImage(systemName: "exclamationmark.bubble.fill")!, rootController: NotificationController())

        let profile = templateNavigationController(unselectedImage: UIImage(systemName: "person")!, selectedImage: UIImage(systemName: "person.fill")!, rootController: ProfileController())
        tabBar.tintColor = .black
        viewControllers = [feed,search,imageSelector,notifications,profile]
    }
    
    func templateNavigationController(unselectedImage : UIImage,selectedImage :UIImage,rootController:UIViewController)->UINavigationController{
        let nav  = UINavigationController(rootViewController: rootController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    
}

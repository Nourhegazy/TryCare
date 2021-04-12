//
//  tabBare.swift
//  TryCarTask
//
//  Created by UPS Apple on 08/04/2021.
//

import UIKit
import  Moya

class tabBare: UITabBarController , UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let postsViewModel = PostsViewModel(api: MoyaProvider<TryCarApi>())
            let postsVC = storyboard.instantiateViewController(withIdentifier: "PostsViewController") as! PostsViewController
            postsVC.viewModel = postsViewModel
        
            let navigationController = UINavigationController(rootViewController: postsVC)
           
           viewControllers = [navigationController]

            if let myFavController = storyboard.instantiateViewController(withIdentifier: "MyFavouriteViewController") as? MyFavouriteViewController {
              
                let navgitaionController1 = UINavigationController(rootViewController: myFavController)
                let viewModel = MyFavouriteViewModel()
                myFavController.viewModel = viewModel
                var array = self.viewControllers
                array?.append(navgitaionController1)
                self.viewControllers = array

            }

        }
    }

       
   
    

  



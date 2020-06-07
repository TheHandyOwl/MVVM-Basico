//
//  Router.swift
//  MVVM Navegable
//
//  Created by Carlos on 07/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class Router {
    
    func goToDetailViewController(navigationController: UINavigationController?, post: Post) {
        let vc = DetailViewController()
        vc.postData = post
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

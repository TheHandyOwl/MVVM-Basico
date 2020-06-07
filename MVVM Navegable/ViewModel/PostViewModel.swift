//
//  ViewModelList.swift
//  MVVM Navegable
//
//  Created by Carlos on 07/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

class PostViewModel {
    
    var refreshData = { () -> () in }
    var webService = WebService()
    
    var dataArray : [Post] = [] {
        didSet {
            refreshData()
        }
    }
    
    func getPostsList() {
        webService.fetchPostsList(successCompletion: { [weak self] (listModel) in
            guard let hasList = listModel else { return }
            self?.dataArray = hasList
            //print("hasList: \(hasList)")
        }) { (error) in
            guard let hasError = error else { return }
            print("Error: \(hasError)")
        }
    }
    
    
    
    
}

//
//  WebService.swift
//  MVVM Navegable
//
//  Created by Carlos on 07/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

class WebService {
    
    func fetchPostsList (successCompletion: @escaping ([Post]?) -> (), errorCompletion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Error: \(error?.localizedDescription ?? "")")
                errorCompletion(error)
            } else {
                var dataArray : [Post]?
                let decoder = JSONDecoder()
                guard let hasData = data else { return }
                dataArray = try! decoder.decode([Post].self, from: hasData)
                successCompletion(dataArray)
            }
        }.resume()
    }
    
}

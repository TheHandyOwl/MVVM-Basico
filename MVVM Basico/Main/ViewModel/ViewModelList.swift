//
//  ViewModelList.swift
//  MVVM Básico
//
//  Created by Carlos on 07/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import Foundation

class ViewModelList {
    
    
    // Enlazar vista con modelo
    var refreshData = { () -> () in } // Devuelve los datos actualizados
    
    // Fuente de datos
    var dataArray : [List] = [] {
        didSet {
            refreshData()
        }
    }
    
    // Esto se sacaría en un refactor y pasarlo a capa Connection y llamarlo aquí
    // Obtener los datos de la API
    func retrieveDataList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                
            guard let json = data else { return }
            
            // Serializar datos
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([List].self, from: json)
            } catch let error {
                print("Ha ocurrido un error \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    
    
}

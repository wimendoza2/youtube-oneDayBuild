//
//  model.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 8/2/22.
//

import Foundation

class Model {
    
    func getVideos(){
        
        // Creamos el objeto URL
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        //obtenemos un URLSession object
        
        let session = URLSession.shared
        
        //obtenemos un data task del objeto URLSession
        
        let dataTask = session.dataTask(with: url!) { (data, respone, error) in
            
            //revisamos que no hayan errores
            if error != nil || data == nil {
                return
                
            }
            
            print(String.init(data: data!, encoding: String.Encoding.utf8) ?? "hola MUndo")
            //parsing the data into video objects
            
        }
        
        //iniciar la tarea
        dataTask.resume()
        
        
    }
}

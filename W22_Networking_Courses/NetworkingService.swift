//
//  NetworkingService.swift
//  W22_Networking_Courses
//
//  Created by Rania Arbash on 2022-03-17.
//

import Foundation

class NetworkingService {
  
    static var shared : NetworkingService = NetworkingService()
    
    func fetchDataFromURL(url: String ,
                         completionHandler : @escaping (StudentInfo)->Void )  {
        
        let urlObj = URL(string: url)!
    
        let task = URLSession.shared.dataTask(with: urlObj)
        { data, response, error in
            guard error == nil else {
                return
            }
            guard let httpRespons = response as? HTTPURLResponse, (200...299).contains(httpRespons.statusCode) else {
                print ("Incorrect response ")
                return
            }
            
            if let jsonData = data {
                    print(jsonData)
              let decoder =  JSONDecoder()
                do {
               let result = try decoder.decode(StudentInfo.self, from: jsonData)
                   
                completionHandler(result)
                }
                catch {
                    print (error)
                }
            }
        }
        task.resume()
      
    }
    
    
    
}

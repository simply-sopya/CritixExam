//
//
//  Created by Swapnil Tilkari on 13/06/22.
//
import Foundation

import Foundation

enum HttpMethod:String{
    case get = "get"
    case post = "post"
}



class APIManager {
    
    static let shared = APIManager()
    
    func dataTask(service:ApiEndpoint,httpMethod:HttpMethod,parameters:[String:String]?,completion:@escaping (AnyObject?, Error?) -> Void) -> Void {
        
        requestResource(service: service.path, httpMethod: httpMethod, parameters: parameters, completion: completion)
    }
    
    private func requestResource(service:String,httpMethod:HttpMethod,parameters:[String:String]?,completion:@escaping (AnyObject?, Error?) -> Void) -> Void {
        
        var request = URLRequest(url: URL(string:"\(ApiHelper.baseURL)\(service)")!)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = httpMethod.rawValue
        print(request)
        if (parameters != nil) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters!, options: .prettyPrinted)
        }
        
        let sessionTask = URLSession(configuration: .default).dataTask(with: request) { (data, response, error) in
            
            if (data != nil){
                let result = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                completion (result as AnyObject, nil)
            }
            
            if (error != nil) {
                completion (nil,error!)
            }
        }
        sessionTask.resume()
    }
}

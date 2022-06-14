
/*
 *
 * CreatedOn: Monday, June 13th 2022
 * CreatedBy: Swapnil Tilkari
 */

import Foundation 


struct NYData : Decodable,Hashable {
    
    var status : String = ""
    var copyright : String = ""
    var num_results : Int = -1
    var articles : [Article] = []
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let status = response["status"] as? String {
            self.status = status
        }
        
        if let copyright = response["copyright"] as? String {
            self.copyright = copyright
        }
        
        if let num_results = response["num_results"] as? Int {
            self.num_results = num_results
        } 
        
        if let results = response["results"] as? [[String : Any]] {
            for item in results {
                let object = Article( response: item)
                self.articles.append(object)
            }
        }
        
    }
}

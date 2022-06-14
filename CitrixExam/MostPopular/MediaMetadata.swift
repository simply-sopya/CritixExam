
/*
 *
 * CreatedOn: Monday, June 13th 2022
 * CreatedBy: Swapnil Tilkari
 */

import Foundation 


struct MediaMetadata : Decodable,Hashable {
    
    var url : String = ""
    var format : String = ""
    var height : Int = -1
    var width : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let url = response["url"] as? String {
            self.url = url
        }
        
        if let format = response["format"] as? String {
            self.format = format
        }
        
        if let height = response["height"] as? Int {
            self.height = height
        }
        
        if let width = response["width"] as? Int {
            self.width = width
        }
        
    }
}

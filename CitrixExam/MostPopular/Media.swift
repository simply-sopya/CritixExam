
/*
 *
 * CreatedOn: Monday, June 13th 2022
 * CreatedBy: Swapnil Tilkari
 */

import Foundation 


struct Media : Decodable,Hashable {
    
    var type : String = ""
    var subtype : String = ""
    var caption : String = ""
    var copyright : String = ""
    var approved_for_syndication : Int = -1
    var mediaMetadata : [MediaMetadata] = []
    
    init() {}
    func getMediumThmbunail() -> String {
        for item in mediaMetadata {
            if item.format == "mediumThreeByTwo440" {
                return item.url
            }
        }
        return ""
    }
    init(response : [String : Any]) {
        
        if let type = response["type"] as? String {
            self.type = type
        }
        
        if let subtype = response["subtype"] as? String {
            self.subtype = subtype
        }
        
        if let caption = response["caption"] as? String {
            self.caption = caption
        }
        
        if let copyright = response["copyright"] as? String {
            self.copyright = copyright
        }
        
        if let approved_for_syndication = response["approved_for_syndication"] as? Int {
            self.approved_for_syndication = approved_for_syndication
        }
        
        if let mediaMetadata = response["media-metadata"] as? [[String : Any]] {
            for item in mediaMetadata {
                let object = MediaMetadata( response: item)
                self.mediaMetadata.append(object)
            }
        }
        
    }
}

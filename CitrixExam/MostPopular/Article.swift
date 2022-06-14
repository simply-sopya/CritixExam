

/*
 * CreatedOn: Monday, June 13th 2022
 * CreatedBy: Swapnil Tilkari
 */

import Foundation 


struct Article : Decodable,Hashable {
    
    var uri : String = ""
    var url : String = ""
    var id : Int = -1
    var asset_id : Int = -1
    var source : String = ""
    var published_date : String = ""
    var updated : String = ""
    var section : String = ""
    var subsection : String = ""
    var nytdsection : String = ""
    var adx_keywords : String = ""
    var byline : String = ""
    var type : String = ""
    var title : String = ""
    var abstract : String = ""
    var des_facet : [String] = []
    var org_facet : [String] = []
    var per_facet : [String] = []
    var geo_facet : [String] = []
    var media : [Media] = []
    var eta_id : Int = -1
    
    init() {}
    
    init(response : [String : Any]) {
        
        if let uri = response["uri"] as? String {
            self.uri = uri
        }
        
        if let url = response["url"] as? String {
            self.url = url
        }
        
        if let id = response["id"] as? Int {
            self.id = id
        }
        
        if let asset_id = response["asset_id"] as? Int {
            self.asset_id = asset_id
        }
        
        if let source = response["source"] as? String {
            self.source = source
        }
        
        if let published_date = response["published_date"] as? String {
            self.published_date = published_date
        }
        
        if let updated = response["updated"] as? String {
            self.updated = updated
        }
        
        if let section = response["section"] as? String {
            self.section = section
        }
        
        if let subsection = response["subsection"] as? String {
            self.subsection = subsection
        }
        
        if let nytdsection = response["nytdsection"] as? String {
            self.nytdsection = nytdsection
        }
        
        if let adx_keywords = response["adx_keywords"] as? String {
            self.adx_keywords = adx_keywords
        }
        
        if let byline = response["byline"] as? String {
            self.byline = byline
        }
        
        if let type = response["type"] as? String {
            self.type = type
        }
        
        if let title = response["title"] as? String {
            self.title = title
        }
        
        if let abstract = response["abstract"] as? String {
            self.abstract = abstract
        }
        
        if let des_facet = response["des_facet"] as? [String] {
            for item in des_facet {
                self.des_facet.append(item)
            }
        }
        
        if let org_facet = response["org_facet"] as? [String] {
            for item in org_facet {
                self.org_facet.append(item)
            }
        }
        
        if let per_facet = response["per_facet"] as? [String] {
            for item in per_facet {
                self.per_facet.append(item)
            }
        }
        
        if let geo_facet = response["geo_facet"] as? [String] {
            
            for item in geo_facet {
                self.geo_facet.append(item)
            }
        }
        
        if let media = response["media"] as? [[String : Any]] {
            for item in media {
                let object = Media( response: item)
                self.media.append(object)
            }
        }
        
        if let eta_id = response["eta_id"] as? Int {
            self.eta_id = eta_id
        }
        
    }
}

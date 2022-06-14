import Foundation

enum ApiEndpoint {
    
    enum Method: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    /// Define all your endpoints here
    case getNewsFeed
}

extension ApiEndpoint {
    
    /// The path for every endpoint
    var path: String {
        switch self {
            
        case .getNewsFeed :
            return "svc/mostpopular/v2/viewed/1.json?api-key=tUvQCmGjziat1KbYzEGNxyKkIaL1AmKa"
        }
    }
    
    /// The method for the endpoint
    var method: ApiEndpoint.Method {
        switch self {
        default:
            return .GET
        }
    }
    
    /// The URL parameters for the endpoint (in case it has any)
    var parameters: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
}

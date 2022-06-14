import Foundation

/// Custom Error enum that we'll use in case
enum NetworkError: Error {
    case noInternet
    case apiFailure
    case invalidResponse
    case decodingError
}

enum APIState : Equatable {
    case Loading
    case none
    case success
    case failure(Failure)
}
enum Failure {
    case ApiError
    case Offline
}


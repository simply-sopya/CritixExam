//
//  MostPopularViewModel.swift
//  CitrixExam
//
//  Created by Swapnil Tilkari on 13/06/22.
//

import Foundation


class MostPopularViewModel : ObservableObject {
    
    @Published var data : NYData = NYData()
    @Published var getMostPopularDataAPIStatus : APIState = .none
    static var shared = MostPopularViewModel()
    private init()  {
        
    }
    
    func getMostPopularData() {
        self.getMostPopularDataAPIStatus = .Loading
        APIManager.shared.dataTask(service: ApiEndpoint.getNewsFeed, httpMethod: .post, parameters: [:]) { (response, error) in
            if response != nil {
                
                if let responseDict = response as? [String : Any] {
                    
                    DispatchQueue.main.async {
                        let data = NYData(response: responseDict)
                        self.data = data
                        self.getMostPopularDataAPIStatus = .success
                    }
                }
            }
            if error != nil {
                DispatchQueue.main.async {
                    self.getMostPopularDataAPIStatus = .failure(.ApiError)
                    print("Error Occoured")
                }
            }
        }
    }
    
}

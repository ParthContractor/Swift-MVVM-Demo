//
//  MoviesListViewModel.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

class MoviesListViewModel: ConsumeRESTService {
    // MARK: - ConsumeRESTService properties
    var urlString: String = API_Str_URLs.movies
    typealias T = MoviesData
    
    var navigationBarTitleForLandingView: String?
    
    var dataSource: [Movie]?
    var RESTServiceError: Error?
    let moviesListCache = NSCache<NSString, MoviesDataContainer>()
    
    func sortByRecentReleaseDate() {
        self.dataSource?.sort(){$0.release_date.asDate > $1.release_date.asDate}
    }
    
    func cacheMoviesData(_ moviesData: [Movie]?) {
        let dataToCache = MoviesDataContainer(data: moviesData)
        moviesListCache.setObject(dataToCache, forKey: CacheKeys.moviesData as NSString)
    }
    
    func fetchData(completionHandler: @escaping () -> Void) {
        consumeRESTService(completionHandler:{ result,error  in
            //Error if any
            if let error = error {
                self.RESTServiceError = error
                completionHandler()
            }
            
            //result if anything
            if let result = result {
                self.navigationBarTitleForLandingView = "SW Movies"
                
                if let rowsData = result.movies {
                    self.dataSource = rowsData
                    self.sortByRecentReleaseDate()
                }
                completionHandler()
            }
        })
    }
}

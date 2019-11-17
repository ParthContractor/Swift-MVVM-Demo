//
//  MovieDetailsViewModel.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

class MovieDetailsViewModel: ConsumeRESTService {
    var urlString: String = ""
    
    typealias T = Character
    
    var navigationBarTitleForLandingView: String?
    
    var dataSource: Movie?
    var listOfCharacters: [Character] = [Character]()

    var RESTServiceError: Error?
    
    func fetchCharactersData(completionHandler: @escaping () -> Void) {
        consumeRESTService(completionHandler:{ result,error  in
            //Error if any
            if let error = error {
                self.RESTServiceError = error
                completionHandler()
            }
            
            //result if anything
            if let result = result {
                self.listOfCharacters.append(result)
                completionHandler()
            }
        })
    }
}
    



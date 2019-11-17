//
//  ConsumeRESTService.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation

//protocol defined for consuming REST Service
//it could be reused because urlString needs to be provided by client who implements this protocol
//Also custom type(it could be custom model object type) is generic which needs to be provided by client who implements this protocol
protocol ConsumeRESTService {
    associatedtype T: Decodable
    var urlString: String { get set }
    func consumeRESTService(completionHandler: @escaping (_ result:T?,_ error:Error?) -> Void)
}

//default implementation is also provided for urlString and returning a result? and error?
extension ConsumeRESTService {
    func consumeRESTService(completionHandler: @escaping (_ result:T?,_ error:Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        //data task from URLSession for fetching remote data
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                completionHandler(nil,error)
            }
            
            guard let jsonData = data else { return }
            
            //data not encoded hence we have to encode it first
            let jsonString = String(decoding: jsonData, as: UTF8.self)
            let encodedData = jsonString.data(using: .utf8)!
            
            //JSONDecoder for decoding/parsing data to our custom models having foundation objects/nested structs using decodable protocol
            let decoder = JSONDecoder()
            
            do {
                let result = try decoder.decode(T.self, from: encodedData)
                //instance of T to be returned after successful decoding process..
                completionHandler(result,nil)
            } catch {
                //error to be returned in case of failure in decoding..
                completionHandler(nil,error)
            }
            
            }.resume()
    }
}

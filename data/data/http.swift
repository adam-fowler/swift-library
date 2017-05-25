//
//  http.swift
//  data
//
//  Created by Adam Fowler on 24/05/2017.
//  Copyright © 2017 Adam Fowler. All rights reserved.
//

import Foundation

public class Http {
    public class func post(url: String, username: String, password: String, data: Data, completion:(@escaping (Data?, URLResponse?, Error?) -> Void)) {
        // authorisation
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.uploadTask(with:request, from:data, completionHandler: completion)
        task.resume()
    }

    public class func post(url: String, data: Data, completion:(@escaping (Data?, URLResponse?, Error?) -> Void)) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        
        let task = URLSession.shared.uploadTask(with:request, from:data, completionHandler: completion)
        task.resume()
    }
    
}
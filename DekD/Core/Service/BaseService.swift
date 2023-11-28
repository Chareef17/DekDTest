//
//  BaseService.swift
//  DekD
//
//  Created by Chareef on 23/11/2566 BE.
//

import UIKit

typealias APICompletion<T> = (Result<T, Error>) -> Void

class BaseService {
    // Enum to represent HTTP methods
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    // Function to get API response with customizable parameters
    func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        parameters: [String: Any]?,
        headers: [String: String]?,
        completion: @escaping APICompletion<T>
    ) {
        // Create a URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        // Set request headers
        headers?.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // Set request body for POST method
        if method == .post, let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // Create a URLSession
        let session = URLSession.shared
        
        // Create a data task
        let task = session.dataTask(with: request) { (data, response, error) in
            // Handle errors
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Ensure there is data
            guard let responseData = data else {
                let error = NSError(domain: "DekD", code: 400, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            // Use JSONDecoder to decode the data into the specified data model
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: responseData)
                completion(.success(decodedData))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        
        // Start the data task
        task.resume()
    }
}
